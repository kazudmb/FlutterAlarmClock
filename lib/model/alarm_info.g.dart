// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlarmInfo _$_$_AlarmInfoFromJson(Map<String, dynamic> json) {
  return _$_AlarmInfo(
    id: json['id'] as int,
    title: json['title'] as String,
    alarmDateTime: DateTime.parse(json['alarmDateTime'] as String),
    isPending: json['isPending'] as int,
    gradientColorIndex: json['gradientColorIndex'] as int,
    repeat: json['repeat'] as String,
  );
}

Map<String, dynamic> _$_$_AlarmInfoToJson(_$_AlarmInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'alarmDateTime': instance.alarmDateTime.toIso8601String(),
      'isPending': instance.isPending,
      'gradientColorIndex': instance.gradientColorIndex,
      'repeat': instance.repeat,
    };
