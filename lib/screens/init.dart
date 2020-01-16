import 'package:flutter/material.dart';
import 'package:gigly/screens/discover/discover.dart';
import 'package:gigly/screens/events/home.dart';

class Init extends StatefulWidget {

  _Init createState() => new _Init();
}

class _Init extends State<Init> {

  List<Widget> widgetList = [HomePage(), Discover()];
  int _initialScreen = 0;

  final List<int> _backstack = [0];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      child: Scaffold(
        body: Column(

        ),
      ),
    );
  }

}

