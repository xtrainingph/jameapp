import 'package:flutter/cupertino.dart';

import 'location_fact.dart';

class Location {
  final int id;
  String name;
  String imagePath;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.imagePath, this.facts);

  static List<Location> fetchAll() {
    return [
      Location(1, 'Paris Fashion Week', 'assets/images/pfw.png', [
        LocationFact('Naomi Campbell', 'She was a bitch'),
        LocationFact('Kate Moss', 'She was not so bitch')
      ]),
      Location(2, 'NY Fashion Week', 'assets/images/nyfw.jpg', [
        LocationFact('Naomi Campbell', 'She was a bitch'),
        LocationFact('Kate Moss', 'She was not so bitch')
      ]),
      Location(3, 'Philippine Fashion Week', 'assets/images/philfw.png', [
        LocationFact('Naomi Campbell', 'She was a bitch'),
        LocationFact('Kate Moss', 'She was not so bitch')
      ]),
    ];
  }

  static Location fetchById(int id) {
    List<Location> locations = Location.fetchAll();

    for (var i = 0; i < locations.length; i++) {
      if (locations[i].id == id) {
        return locations[i];
      }
    }

    return null;
  }
}
