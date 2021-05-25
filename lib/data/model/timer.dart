import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer.freezed.dart';
part 'timer.g.dart';

@freezed
abstract class Timer with _$Timer {
  const factory Timer({
    int? timerId,
    required DateTime alarmDateTime,
  }) = _Timer;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);
}
