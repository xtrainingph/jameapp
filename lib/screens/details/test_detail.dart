import 'package:flutter/material.dart';
import 'package:gigly/screens/details/google_map_info.dart';
import '../../main.dart';
import 'image_banner.dart';
import 'text_section.dart';
import '../../models/location.dart';

class TestDetail extends StatelessWidget {
  final int _eventID;

  static const double _hPad = 16.0;

  TestDetail(this._eventID);

  @override
  Widget build(BuildContext context) {
    //final locations = Location.fetchById(_eventID);
    final location = Location.fetchById(_eventID);

    return Scaffold(
        appBar: AppBar(
          title: Text(location.name),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                ImageBanner(location.imagePath),
                Container(
                    padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4),
                    child: new GestureDetector(
                      onTap: () => _onClickLocationRoute(context, 14),
                      child: Text("View location", textAlign: TextAlign.center,),
                    ))
              ]..addAll(textSections(location))),
        ));
  }

  _onClickLocationRoute(BuildContext context, int id) {
    Navigator.pushNamed(context, LocationRoute, arguments: {"id": id});
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
