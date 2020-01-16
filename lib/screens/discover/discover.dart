import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  @override
  DiscoverState createState() => new DiscoverState();
}

class DiscoverState extends State<Discover> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment(-.2, 0),
              image: NetworkImage(
                  'https://cdn.fstoppers.com/styles/full/s3/media/2018/07/28/chureito_1_of_1.jpg'),
              fit: BoxFit.cover),
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(bottom: 20),
        child: Container (
          height: 130.0,
          width: 1024.0,
          alignment: Alignment.centerRight,
          decoration: new BoxDecoration(
            color: Colors.black.withOpacity(0.4),
          ),
            padding: EdgeInsets.only(left: 0, top: 20.0, bottom: 25.0, right: 50.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text ("Discover".toUpperCase(),
                    style: Theme.of(context).textTheme.title),
              ),
              Container(
                padding: EdgeInsets.only(left: 60),
                child: Text ("wonders".toUpperCase(),
                    style: Theme.of(context).textTheme.body2),
              )
            ],
          )


        )
      ),
    );
  }
}
