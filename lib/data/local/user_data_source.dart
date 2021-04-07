import 'package:light_alarm/data/model/user.dart';

abstract class UserDataSource {
  Future<User?> fetchUser();
  Future<void> insertUser(User user);
}
