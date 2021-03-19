import 'package:freezed_annotation/freezed_annotation.dart';

part 'Alarm.freezed.dart';

@freezed
class Alarm with _$Alarm {
  factory Alarm({
    @Default(-1) int id,
    @Default('') String title,
    @Default('') DateTime alarmDateTime,
    @Default(0) int isPending,
    @Default(0) int gradientColorIndex,
    @Default('') String repeat,
  }) = _Alarm;

  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
}
