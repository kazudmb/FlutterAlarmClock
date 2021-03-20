// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alarm _$_$_AlarmFromJson(Map<String, dynamic> json) {
  return _$_Alarm(
    userId: json['userId'] as int,
    alarms: (json['alarms'] as List<dynamic>)
        .map((e) => AlarmInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_AlarmToJson(_$_Alarm instance) => <String, dynamic>{
      'userId': instance.userId,
      'alarms': instance.alarms,
    };
