// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
      event_id: json['event_id'] as int,
      event_name: json['event_name'] as String,
      event_img: json['event_img'] as String,
      subs: (json['subs'] as List)
          ?.map((e) => e == null
              ? null
              : EventDetail.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'event_id': instance.event_id,
      'event_name': instance.event_name,
      'event_img': instance.event_img,
      'subs': instance.subs
    };
