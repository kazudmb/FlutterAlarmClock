// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alarm _$_$_AlarmFromJson(Map<String, dynamic> json) {
  return _$_Alarm(
    alarmId: json['alarmId'] as int?,
    title: json['title'] as String,
    alarmDateTime: DateTime.parse(json['alarmDateTime'] as String),
    isPending: json['isPending'] as int,
    gradientColorIndex: json['gradientColorIndex'] as int,
    repeat: json['repeat'] as String,
  );
}

Map<String, dynamic> _$_$_AlarmToJson(_$_Alarm instance) => <String, dynamic>{
      'alarmId': instance.alarmId,
      'title': instance.title,
      'alarmDateTime': instance.alarmDateTime.toIso8601String(),
      'isPending': instance.isPending,
      'gradientColorIndex': instance.gradientColorIndex,
      'repeat': instance.repeat,
    };
