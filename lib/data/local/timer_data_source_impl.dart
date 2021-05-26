import 'package:light_alarm/data/local/app_database.dart';
import 'package:light_alarm/data/local/timer_data_source.dart';
import 'package:light_alarm/data/model/timer.dart';
import 'package:logger/logger.dart';

class TimerDataSourceImpl extends TimerDataSource {
  TimerDataSourceImpl(this._database);

  final AppDatabase _database;
  var logger = Logger();

  @override
  Future<Timer?> fetchTimer() async {
    Timer? _timer;
    var db = await _database.getDatabase();
    var result = await db.query(_database.tableTimer);
    result.forEach((element) {
      _timer = Timer.fromJson(element);
    });
    logger.d(_timer);
    return _timer;
  }

  @override
  Future<void> insertTimer(Timer timer) async {
    var db = await _database.getDatabase();
    await db.insert(_database.tableTimer, timer.toJson());
  }

  @override
  Future<int?> deleteTimer() async {
    var db = await _database.getDatabase();
    var result = await db.delete(_database.tableTimer);
    logger.d('count: $result');
    return result;
  }
}
