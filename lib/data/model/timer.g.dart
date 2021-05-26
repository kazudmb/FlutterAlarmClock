// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timer _$_$_TimerFromJson(Map<String, dynamic> json) {
  return _$_Timer(
    timerId: json['timerId'] as int?,
    timerDateTime: DateTime.parse(json['timerDateTime'] as String),
  );
}

Map<String, dynamic> _$_$_TimerToJson(_$_Timer instance) => <String, dynamic>{
      'timerId': instance.timerId,
      'timerDateTime': instance.timerDateTime.toIso8601String(),
    };
