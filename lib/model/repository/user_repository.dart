import 'package:light_alarm/model/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}
