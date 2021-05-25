import 'package:light_alarm/data/model/timer.dart';

abstract class TimerRepository {
  Future<Timer?> fetchTimer();
  Future<void> insertTimer(Timer timer);
  Future<int?> deleteTimer(int id);
}
