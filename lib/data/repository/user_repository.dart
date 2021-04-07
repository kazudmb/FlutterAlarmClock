import 'package:light_alarm/data/model/user.dart';

abstract class UserRepository {
  Future<User?> fetchUser();
  Future<void> insertUser(User user);
}
