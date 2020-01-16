import 'package:json_annotation/json_annotation.dart';

import 'event_detail.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  int event_id;
  String event_name;
  String event_img;
  List<EventDetail> subs;

  Event({this.event_id, this.event_name, this.event_img, this.subs});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

}

class EventList {
  List<Event> events;

  EventList({this.events});

  factory EventList.fromJson(List<dynamic> json) {
    return EventList(
        events: json
            .map((e) => Event.fromJson(e as Map<String, dynamic>))
            .toList());
  }




}