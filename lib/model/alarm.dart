import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:light_alarm/model/alarm_info.dart';

part 'alarm.freezed.dart';
part 'alarm.g.dart';

@freezed
abstract class Alarm with _$Alarm {
  const factory Alarm({
    required int userId,
    required List<AlarmInfo> alarms,
  }) = _Alarm;

  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
}
