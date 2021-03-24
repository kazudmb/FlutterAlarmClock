import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';
part 'alarm.g.dart';

@freezed
abstract class Alarm with _$Alarm {
  const factory Alarm({
    required int id,
    required String title,
    required DateTime alarmDateTime,
    required int isPending,
    required int gradientColorIndex,
    required String repeat,
  }) = _Alarm;

  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
}
