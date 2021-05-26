import 'package:light_alarm/data/local/timer_data_source.dart';
import 'package:light_alarm/data/model/timer.dart';
import 'package:light_alarm/data/repository/timer_repository.dart';

class TimerRepositoryImpl implements TimerRepository {
  TimerRepositoryImpl({required TimerDataSource timerDataSource})
      : _timerDataSource = timerDataSource;

  final TimerDataSource _timerDataSource;

  @override
  Future<Timer?> fetchTimer() {
    return _timerDataSource.fetchTimer();
  }

  @override
  Future<void> insertTimer(Timer timer) {
    return _timerDataSource.insertTimer(timer);
  }

  @override
  Future<int?> deleteTimer() {
    return _timerDataSource.deleteTimer();
  }
}
