import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gigly/db/db_helper.dart';
import 'package:gigly/main.dart';
import 'package:gigly/models/event.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Event> data;

//  Future<String> getData() async {
//    var response = await http.get(
//        Uri.encodeFull("https://runningmatelife.com/flutter-api/events.json"),
//        headers: {"Accept": "application/json"});
//
//    this.setState(() {
//      data = json.decode(response.body);
//    });
//
//    return "Success!";
//  }

  Future<String> getEvents() async {
    http.Response response = await http.get("https://runningmatelife.com/flutter-api/events.json");
    var respJson = json.decode(response.body);

    //List<EventList> evList;

    this.setState(() {
      data = (respJson['result'] as List)
          .map((ev) => Event.fromJson(ev))
          .toList();
    });

    GglyEvent gglyEventx;

    var dbHelper = DbHelper();

    for(int i=0; i<data.length; i++) {
      gglyEventx = new GglyEvent(eventID: data[i].event_id, eventName: data[i].event_name, eventImg: data[i].event_img);
      //gglyEvent.add(gglyEventx);
      dbHelper.insertEvent(gglyEventx);
    }

    return "success";
  }

  @override
  void initState() {
    this.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text("Events"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
                child: new Container(
                    constraints: BoxConstraints.expand(height: 200.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: new BorderRadius.circular(20.0)),
                    child: Image.network(data[index].event_img,
                        fit: BoxFit.cover))) //new Text(data[index]["event_name"]),,
            ,
            onTap: () => _onLocationTap(context, data[index].event_id),
            onPanUpdate: (details) {
              if(details.delta.dx > 0)
                _onSwipeLeft(context);
            },
          );
        },
      ),
    );
  }

  _onSwipeLeft(BuildContext context) {
    Navigator.pushNamed(context, EventsRoute);
  }

  _onLocationTap(BuildContext context, int id) {
    Navigator.pushNamed(context, EventDetailRoute, arguments: {"id": id});
  }
}
