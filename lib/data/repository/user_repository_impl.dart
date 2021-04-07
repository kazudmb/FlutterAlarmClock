import 'package:light_alarm/data/local/user_data_source.dart';
import 'package:light_alarm/data/model/user.dart';
import 'package:light_alarm/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  final UserDataSource _userDataSource;

  @override
  Future<User?> fetchUser() {
    return _userDataSource.fetchUser();
  }

  @override
  Future<void> insertUser(User user) {
    return _userDataSource.insertUser(user);
  }
}
