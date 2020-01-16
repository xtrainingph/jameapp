
import 'package:json_annotation/json_annotation.dart';
part 'event_detail.g.dart';

@JsonSerializable()
class EventDetail {
  String sub_title;
  String sub_desc;

  EventDetail({this.sub_title, this.sub_desc});

  factory EventDetail.fromJson(Map<String, dynamic> json) => _$EventDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EventDetailToJson(this);

}