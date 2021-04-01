import 'package:light_alarm/data/model/alarm.dart';
import 'package:light_alarm/data/model/user.dart';

abstract class UserDataSource {
  void insertUser(User user);
  Future<User?> getUser();
  Future<int> updatePending(int id, int isPending);
  Future<int> delete(int id);
  void insertAlarm(Alarm alarm);
}
