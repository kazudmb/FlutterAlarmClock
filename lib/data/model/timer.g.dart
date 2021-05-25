// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timer _$_$_TimerFromJson(Map<String, dynamic> json) {
  return _$_Timer(
    timerId: json['timerId'] as int?,
    alarmDateTime: DateTime.parse(json['alarmDateTime'] as String),
  );
}

Map<String, dynamic> _$_$_TimerToJson(_$_Timer instance) => <String, dynamic>{
      'timerId': instance.timerId,
      'alarmDateTime': instance.alarmDateTime.toIso8601String(),
    };
