import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_info.freezed.dart';
part 'alarm_info.g.dart';

@freezed
abstract class AlarmInfo with _$AlarmInfo {
  const factory AlarmInfo({
    required int id,
    required String title,
    required DateTime alarmDateTime,
    required int isPending,
    required int gradientColorIndex,
    required String repeat,
  }) = _AlarmInfo;

  factory AlarmInfo.fromJson(Map<String, dynamic> json) =>
      _$AlarmInfoFromJson(json);
}
