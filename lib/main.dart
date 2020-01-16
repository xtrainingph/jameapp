import 'package:flutter/material.dart';
import 'package:gigly/screens/details/test_detail.dart';
import 'package:gigly/screens/events/events.dart';
import 'package:gigly/screens/events/home.dart';
import 'package:gigly/screens/events/homepage.dart';
import 'screens/discover/discover.dart';
import 'screens/festival/festival.dart';
import 'screens/major/major.dart';
import 'screens/network/network.dart';
import 'style.dart';
import 'screens/events/events.dart';
import 'screens/details/location_detail.dart';

//void main() => runApp(TestDetail());
const EventsRoute = '/';
const EventDetailRoute = '/test_detail';
const LocationRoute = '/location_detail';
const DiscoverRoute = '/discover';
const FestivalRoute = '/festival';
const MajorRoute = '/major';
const NetworkRoute = '/network';

void main() {
  return runApp(MaterialApp(
    //home: Events(),
    onGenerateRoute: _routes(),
    theme: _themeData(),
  ));
}

RouteFactory _routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    Widget screen;

    switch (settings.name) {
      case EventsRoute:
        screen = Home();
        break;
      case DiscoverRoute:
        screen = Discover();
        break;
      case MajorRoute:
        screen = Major();
        break;
      case FestivalRoute:
        screen = Festival();
        break;
      case NetworkRoute:
        screen = Network();
        break;
      case EventDetailRoute:
        screen = TestDetail(arguments['id']);
        break;
      case LocationRoute:
        screen = EventLocation();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}

ThemeData _themeData() {
  return ThemeData(
      appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
      textTheme: TextTheme(title: TitleTextStyle, body1: Body2TextStyle, body2: Body1TextStyle, display4: CalendarHeaderStyle));
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: TestDetail(),
//    );
//  }
//}
