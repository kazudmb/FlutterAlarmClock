import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:light_alarm/data/model/alarm.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int userId,
    required List<Alarm> alarms,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
