import 'package:light_alarm/data/local/app_database.dart';
import 'package:light_alarm/data/local/user_data_source.dart';
import 'package:light_alarm/data/model/user.dart';
import 'package:logger/logger.dart';

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this._database);

  final AppDatabase _database;
  var logger = Logger();

  @override
  Future<User?> fetchUser() async {
    User? _user;
    var db = await _database.getDatabase();
    var result = await db.query(_database.tableUser);
    if (result.isEmpty) {
      await insertUser(const User());
      // 再起呼び出し
      return fetchUser();
    } else {
      result.forEach((element) {
        _user = User.fromJson(element);
      });
    }
    logger.d(_user);
    return _user;
  }

  @override
  Future<void> insertUser(User user) async {
    var db = await _database.getDatabase();
    var result = await db.insert(_database.tableUser, user.toJson());
    logger.d(result);
  }
}
