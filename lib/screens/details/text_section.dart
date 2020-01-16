import 'package:flutter/material.dart';
import 'package:gigly/screens/details/google_map_info.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gigly/main.dart';

class TextSection extends StatelessWidget {
  final String _title;
  final String _body;

  static const double _hPad = 16.0;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4),
            child: Text(_title, style: Theme.of(context).textTheme.title),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4),
            child: Text(_body, style: Theme.of(context).textTheme.body1),
          )
        ]);
  }


}
