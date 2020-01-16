import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class Major extends StatefulWidget {
  @override
  MajorState createState() => new MajorState();
}

class MajorState extends State<Major> {
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
  ];

  List<Widget> _tiles = const <Widget>[
    const _MajorStateTile(
        Colors.green,
        "https://www.glastonburyfestivals.co.uk/wp-content/uploads/2019/05/1557604207_5ae08471-f27e-40f9-82ea-dc440b36c391.jpeg",
        4),
    const _MajorStateTile(
        Colors.lightBlue,
        "http://www2.pictures.gi.zimbio.com/Amy+Winehouse+T+Park+Festival+2008+Day+3+uDUz_NPg52ol.jpg",
        8),
    const _MajorStateTile(
        Colors.amber,
        "https://www.glastonburyfestivals.co.uk/wp-content/uploads/2014/05/1251977925_glasto2.jpg",
        4),
    const _MajorStateTile(
        Colors.brown,
        "https://static.gigwise.com/gallery/glastonbury_14_wenn1949656.jpg",
        10),
    const _MajorStateTile(
        Colors.deepOrange,
        "https://media1.popsugar-assets.com/files/thumbor/a6NvZcGsrDv8okQpgbb7sC7i8vU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/upl0/20/202476/06_2008/wenn1100250/i/Glastonbury-2008-Headliners-Announced.jpg",
        7),
    const _MajorStateTile(
        Colors.indigo,
        "https://www.efestivals.co.uk/photos/2008/glastonbury/AroundTheSite3-Glastonbury2008-PB21.JPG",
        5),
    const _MajorStateTile(Colors.red,
        "https://live.staticflickr.com/269/18808043710_308d37478f_b.jpg", 4),
    const _MajorStateTile(
        Colors.pink,
        "https://cdn.glastonburyfestivals.co.uk/wp-content/uploads/2015/05/1432713396_img397-1024x648.jpg",
        5),
    const _MajorStateTile(
        Colors.purple,
        "https://www.glastonburyfestivals.co.uk/wp-content/uploads/2014/05/1251977925_glasto2.jpg",
        4),
    const _MajorStateTile(
        Colors.blue,
        "https://www.glastonburyfestivals.co.uk/wp-content/uploads/2014/05/1251977925_glasto2.jpg",
        2),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey,
        body: new Stack(children: <Widget>[
          Positioned(
            top: 10,
              width: 1024,
              child: Container(
                height: 100,
            color: Colors.pink,
            child: Image.network(
              "https://www.glastonburyfestivals.co.uk/wp-content/uploads/2014/05/1251977925_glasto2.jpg",
            ),
          )),
          Positioned(
            top: 102,
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              padding: const EdgeInsets.all(0),
            ),
          )
        ]));
  }
}

class _MajorStateTile extends StatelessWidget {
  const _MajorStateTile(this.backgroundColor, this.iconData, this.shape);

  final Color backgroundColor;
  final String iconData;
  final int shape;

  @override
  Widget build(BuildContext context) {
    return shape != 4
        ? new ClipPolygon(
            sides: shape,
            borderRadius: 3.0,
            // Default 0.0 degrees
            rotate: 45.0,
            // Default 0.0 degrees
            boxShadows: [
              PolygonBoxShadow(color: Colors.red, elevation: 7.0),
              PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
            ],
            child: new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(iconData), fit: BoxFit.cover)),
            ),
          )
        : new ClipPath(
            clipper: DiagonalPathClipperOne(),
            child: Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(iconData), fit: BoxFit.cover)),
            ),
          );
  }
}
