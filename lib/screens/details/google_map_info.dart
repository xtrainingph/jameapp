import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapInfo extends StatelessWidget {

  double _longitude;
  double _latitude;
  GoogleMapController mapController;

  final LatLng _center = const LatLng(0.0, 0.0);


  GoogleMapInfo(this._longitude, this._latitude);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 1,
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
