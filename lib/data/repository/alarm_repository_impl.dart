import 'package:light_alarm/data/local/alarm_data_source.dart';
import 'package:light_alarm/data/model/alarm.dart';
import 'package:light_alarm/data/repository/alarm_repository.dart';

class AlarmRepositoryImpl implements AlarmRepository {
  AlarmRepositoryImpl({required AlarmDataSource alarmDataSource})
      : _alarmDataSource = alarmDataSource;

  final AlarmDataSource _alarmDataSource;

  @override
  Future<List<Alarm>?> fetchAlarms() {
    return _alarmDataSource.fetchAlarms();
  }

  @override
  Future<void> insertAlarm(Alarm alarm) {
    return _alarmDataSource.insertAlarm(alarm);
  }

  @override
  Future<int?> updatePending(int id, int isPending) {
    return _alarmDataSource.updatePending(id, isPending);
  }

  @override
  Future<int?> deleteAlarm(int id) {
    return _alarmDataSource.deleteAlarm(id);
  }
}
