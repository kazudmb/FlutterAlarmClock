import 'package:light_alarm/data/local/app_database.dart';
import 'package:light_alarm/data/local/user_data_source.dart';
import 'package:light_alarm/data/model/alarm.dart';
import 'package:light_alarm/data/model/user.dart';
import 'package:logger/logger.dart';

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this._database);

  final AppDatabase _database;
  var logger = Logger();

  @override
  Future<void> insertUser(User user) async {
    var db = await _database.getDatabase();
    await db.insert(_database.tableAlarm, user.toJson());
  }

  @override
  Future<User?> getUser() async {
    User? _user;
    var db = await _database.getDatabase();
    var result = await db.query(_database.tableAlarm);
    if (result.isEmpty) {
      // TODO(dmb): userIdは仮の値
      await insertUser(const User(userId: -1));
      // 再起呼び出し
      getUser();
    } else {
      result.forEach((element) {
        _user = User.fromJson(element);
      });
    }
    return _user;
  }

  @override
  Future<int?> updatePending(int id, int isPending) async {
    var db = await _database.getDatabase();
    var values = <String, dynamic>{
      _database.columnPending: isPending,
    };
    return await db.update(_database.tableAlarm, values,
        where: '$_database.columnId = ?', whereArgs: [id]);
  }

  @override
  Future<int?> delete(int id) async {
    var db = await _database.getDatabase();
    return await db.delete(_database.tableAlarm,
        where: '$_database.columnId = ?', whereArgs: [id]);
  }

  @override
  void insertAlarm(Alarm alarm) async {
    var db = await _database.getDatabase();
    await db.insert(_database.tableAlarm, alarm.toJson());
  }
}
