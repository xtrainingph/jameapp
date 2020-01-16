import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "dev_gigly.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE ggly_event(event_id INTEGER PRIMARY KEY, event_name TEXT, event_img TEXT);"
          "CREATE TABLE ggly_event_detail(detail_id INTEGER PRIMARY KEY, event_id, sub_title TEXT, sub_description TEXT)",
    );

    print("Bitch are created");
  }

  Future<void> insertEvent(GglyEvent gglyEvent) async {
    // Get a reference to the database.
    final Database db = await _db;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'ggly_event',
      gglyEvent.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertEventDetails(GglyEventDetail gglyEvent) async {
    // Get a reference to the database.
    final Database db = await _db;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'ggly_event_detail',
      gglyEvent.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}


class GglyEvent {
  final int eventID;
  final String eventName;
  final String eventImg;
  final List<GglyEventDetail> subs;

  GglyEvent({this.eventID, this.eventName, this.eventImg, this.subs});

  Map<String, dynamic> toMap() {
    return {
      'event_id': eventID,
      'event_name': eventName,
      'event_img': eventImg,
      'subs': subs
    };
  }

  @override
  String toString() {
    return 'Event {id: $eventID, name: $eventName, img_file: $eventImg}';
  }
}

class GglyEventDetail {
  final int detailID;
  final int eventID;
  final String subTitle;
  final String subDesc;

  GglyEventDetail({this.detailID, this.eventID, this.subTitle, this.subDesc});


  Map<String, dynamic> toMap() {
    return {
      'detail_id': detailID,
      'event_id': eventID,
      'sub_title': subTitle,
      'sub_description': subDesc,
    };
  }

  @override
  String toString() {
    return 'Event {id: $eventID, name: $subTitle, img_file: $subDesc}';
  }


}