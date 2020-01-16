import 'package:flutter/material.dart';
import 'package:gigly/api/event_api.dart';
import 'package:gigly/main.dart';
import 'package:gigly/models/event.dart';
import 'package:gigly/screens/details/test_detail.dart';
import '../../models/location.dart';
import 'dart:convert';

EventList eventList;

class EventsPage extends StatefulWidget {

//  EventsPage({Key key, this.title}) : super(key: key);
//  final String title;

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventsPage> {
  EventList breedList = EventList();

  void getCatData() async {
    var catJson = await EventApi().getEvents();
    print(catJson);

    var catMap = json.decode(catJson);
    setState(() {
      breedList = EventList.fromJson(catMap);
    });
  }
  @override
  void initState() {
    super.initState();
    getCatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
          itemCount: (breedList == null ||
              breedList.events == null ||
              breedList.events.length == 0)
              ? 0
              : breedList.events.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestDetail(eventList.events[index].event_id);
                }));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(eventList.events[index].event_name),
                    subtitle: Text(eventList.events[index].event_img),
                  ),
                ),
              ),
            );
          }),
    );
  }

/*@override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    eventList = EventList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Events'),
        ),
        body: ListView(
          children: eventList
              .map((location) => GestureDetector(
                    child: Container(
                        constraints: BoxConstraints.expand(height: 200.0),
                        decoration: BoxDecoration(color: Colors.grey),
                        child:
                            Image.asset(location.imagePath, fit: BoxFit.cover)),
                    onTap: () => _onLocationTap(context, location.id),
                  ))
              .toList(),
        ));
  }

  _onLocationTap(BuildContext context, int id) {
  Navigator.pushNamed(context, EventDetailRoute, arguments: {"id": id});
  }*/



}