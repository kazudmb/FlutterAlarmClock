import 'package:light_alarm/data/local/app_database.dart';
import 'package:light_alarm/data/local/user_data_source.dart';
import 'package:light_alarm/data/model/alarm.dart';
import 'package:light_alarm/data/model/user.dart';

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this._database);

  static const String keyThemeMode = 'theme_mode';

  final AppDatabase _database;

  @override
  void insertUser(User user) async {
    var db = await _database.getDatabase();
    var result = await db!.insert(_database.tableAlarm, user.toJson());
    print('result : $result');
  }

  @override
  Future<User?> getUser() async {
    User? _user;
    var db = await _database.getDatabase();
    var result = await db!.query(_database.tableAlarm);
    result.forEach((element) {
      _user = User.fromJson(element);
    });
    return _user;
  }

  @override
  Future<int> updatePending(int id, int isPending) async {
    var db = await _database.getDatabase();
    var values = <String, dynamic>{
      _database.columnPending: isPending,
    };
    return await db!.update(_database.tableAlarm, values,
        where: '$_database.columnId = ?', whereArgs: [id]);
  }

  @override
  Future<int> delete(int id) async {
    var db = await _database.getDatabase();
    return await db!.delete(_database.tableAlarm,
        where: '$_database.columnId = ?', whereArgs: [id]);
  }

  @override
  void insertAlarm(Alarm alarm) async {
    var db = await _database.getDatabase();
    var result = await db!.insert(_database.tableAlarm, alarm.toJson());
    print('result : $result');
  }
}
