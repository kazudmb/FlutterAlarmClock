import 'package:light_alarm/model/Alarm.dart';

abstract class AlarmRepository {
  Future<Alarm> getAlarm();
}
