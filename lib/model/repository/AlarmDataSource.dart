import 'package:light_alarm/model/Alarm.dart';

abstract class AlarmDataSource {
  Future<Alarm> getAlarm();
}
