import 'package:flutter/material.dart';
import 'package:gigly/main.dart';

class Network extends StatefulWidget {
  NetworkState createState() => new NetworkState();
}

class NetworkState extends State<Network> {
  List<String> _imgAssets = [
    "assets/images/img_discover.jpg",
    "assets/images/img_major.jpg",
    "assets/images/img_festival.jpg",
    "assets/images/img_event.jpg",
    "assets/images/img_network.jpg",
    "assets/images/img_shop.jpg"
  ];
  List<String> _titles = [
    "Discover",
    "Major",
    "Festival",
    "Event",
    "Network",
    "Shop"
  ];
  List<String> _subtitles = [
    "wonders",
    "epics",
    "livin",
    "trip",
    "channel",
    "drop"
  ];

  double _containerHeight = 120,
      _imageHeight = 80,
      _iconTop = 44,
      _iconLeft = 12,
      _marginLeft = 110;

  Widget xxx() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.pushNamed(context, DiscoverRoute);
              }

              if (index == 1) {
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Major link', style: TextStyle(color: Colors.pink),), elevation: 10.0, backgroundColor: Colors.yellowAccent));
                Navigator.pushNamed(context, MajorRoute);
              }

              if (index == 2) {
                Navigator.pushNamed(context, FestivalRoute);
              }

              if (index == 3) {
                Navigator.pushNamed(context, FestivalRoute);
              }

              if (index == 4) {
                Navigator.pushNamed(context, NetworkRoute);
              }

              if (index == 5) {
                Navigator.pushNamed(context, FestivalRoute);
              }
            },
            child: Container(
                constraints: new BoxConstraints.expand(height: 120),
                alignment: Alignment.centerRight,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage(_imgAssets[index]),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    ),
                    color: Color(0xFF000000).withOpacity(0.7)),
                child: Container(
                    margin: EdgeInsets.only(
                        left: 0, top: 40.0, bottom: 25.0, right: 20.0),
                    alignment: Alignment.centerRight,
                    child: Column(children: <Widget>[
                      Container(
                          alignment: Alignment.centerRight,
                          child: Text(_titles[index].toUpperCase(),
                              style: Theme.of(context).textTheme.title)),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(_subtitles[index].toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0)),
                      )
                    ]))));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            height: 1000,
            child: xxx(),
          ),
          Positioned(
            left: _iconLeft,
            top: _iconTop,
            child: Icon(Icons.settings, color: Colors.white),
          ),
          Positioned(
            right: _iconLeft,
            top: _iconTop,
            child: Icon(Icons.bubble_chart, color: Colors.transparent),
          ),
          Positioned(
            left: _iconLeft,
            top: _containerHeight - _imageHeight / 0.89,
            child: Image.asset("assets/images/img_logo.png",
                fit: BoxFit.cover, width: _imageHeight),
          ),
          Positioned(
              //left: _marginLeft,
              top: _containerHeight - (_imageHeight / 2.5),
              child:
                  xxx() //Text("CopsOnRoad", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
              ),
          Positioned.fill(
            left: _marginLeft,
            top: _containerHeight + (_imageHeight / 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Gold", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("22", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Silver", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("28", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Bronze", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
