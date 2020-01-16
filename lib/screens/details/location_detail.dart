import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class EventLocation extends StatefulWidget {
  @override
  _LocationDetail createState() => _LocationDetail(0);
}

class _LocationDetail extends State<EventLocation> {
  final int _eventID;

  _LocationDetail(this._eventID);

  GoogleMapController mapController;

  final LatLng _center = const LatLng(12.8797, 121.7740);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Places I hopped in'),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 6.0,
          ),
        ),
      ),
    );

  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

}