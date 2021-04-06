import 'package:light_alarm/data/local/user_data_source.dart';
import 'package:light_alarm/data/model/alarm.dart';
import 'package:light_alarm/data/model/user.dart';
import 'package:light_alarm/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  final UserDataSource _userDataSource;

  @override
  Future<void> insertUser(User user) {
    return _userDataSource.insertUser(user);
  }

  @override
  Future<User?> getUser() {
    return _userDataSource.getUser();
  }

  @override
  Future<int?> updatePending(int id, int isPending) {
    return _userDataSource.updatePending(id, isPending);
  }

  @override
  Future<int?> delete(int id) {
    return _userDataSource.delete(id);
  }

  @override
  void insertAlarm(Alarm alarm) {
    return _userDataSource.insertAlarm(alarm);
  }
}
