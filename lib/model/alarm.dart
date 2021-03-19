import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';

@freezed
abstract class Alarm with _$Alarm {
  factory Alarm({
    int id,
    String title,
    DateTime alarmDateTime,
    int isPending,
    int gradientColorIndex,
    String repeat,
  }) = _Alarm;

  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
}
