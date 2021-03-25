import 'package:light_alarm/model/alarm.dart';
import 'package:light_alarm/model/repository/user_repository.dart';
import 'package:light_alarm/model/user.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUser() async {
    // TODO(dmb): Alarmをdbから取得して返す処理を実装すること
    print('called UserRepositoryImpl getUser()');
    return User(userId: -1, alarms: [] as List<Alarm>);
  }
}
