import 'package:light_alarm/data/model/timer.dart';

abstract class TimerDataSource {
  Future<Timer?> fetchTimer();
  Future<void> insertTimer(Timer alarm);
  Future<int?> deleteTimer(int id);
}
