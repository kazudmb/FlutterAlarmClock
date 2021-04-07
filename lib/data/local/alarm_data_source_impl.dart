import 'package:light_alarm/data/local/alarm_data_source.dart';
import 'package:light_alarm/data/local/app_database.dart';
import 'package:light_alarm/data/model/alarm.dart';
import 'package:logger/logger.dart';

class AlarmDataSourceImpl extends AlarmDataSource {
  AlarmDataSourceImpl(this._database);

  final AppDatabase _database;
  var logger = Logger();

  @override
  Future<List<Alarm>?> fetchAlarms() async {
    List<Alarm>? _alarms;
    var db = await _database.getDatabase();
    var result = await db.query(_database.tableAlarm);
    result.forEach((element) {
      _alarms?.add(Alarm.fromJson(element));
    });
    logger.d(_alarms);
    return _alarms;
  }

  @override
  Future<void> insertAlarm(Alarm alarm) async {
    var db = await _database.getDatabase();
    await db.insert(_database.tableAlarm, alarm.toJson());
  }

  @override
  Future<int?> updatePending(int id, int isPending) async {
    var db = await _database.getDatabase();
    var values = <String, dynamic>{
      _database.columnPending: isPending,
    };
    return await db.update(_database.tableAlarm, values,
        where: '$_database.columnId = ?', whereArgs: [id]);
  }

  @override
  Future<int?> deleteAlarm(int id) async {
    var db = await _database.getDatabase();
    return await db.delete(_database.tableAlarm,
        where: '$_database.columnId = ?', whereArgs: [id]);
  }
}
