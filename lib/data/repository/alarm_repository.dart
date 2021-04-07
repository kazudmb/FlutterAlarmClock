import 'package:light_alarm/data/model/alarm.dart';

abstract class AlarmRepository {
  Future<List<Alarm>?> fetchAlarms();
  Future<void> insertAlarm(Alarm alarm);
  Future<int?> updatePending(int id, int isPending);
  Future<int?> deleteAlarm(int id);
}
