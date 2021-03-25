import 'package:light_alarm/model/alarm.dart';
import 'package:light_alarm/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final String tableAlarm = 'alarm';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDateTime = 'alarmDateTime';
final String columnPending = 'isPending';
final String columnColorIndex = 'gradientColorIndex';
final String columnRepeat = 'repeat';

class AlarmHelper {
  factory AlarmHelper() {
    print('called AlarmHelper()');
    AlarmHelper? _alarmHelper;
    if (_alarmHelper == null) {
      _alarmHelper = AlarmHelper();
    }
    return _alarmHelper;
  }

  Future<Database> get database async {
    Database _database = await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableAlarm ( 
          $columnId integer primary key autoincrement, 
          $columnTitle text not null,
          $columnDateTime text not null,
          $columnPending integer not null,
          $columnColorIndex integer,
          $columnRepeat text not null)
        ''');
      },
    );
    return database;
  }

  void insertUser(User user) async {
    var db = await this.database;
    var result = await db.insert(tableAlarm, user.toJson());
    print('result : $result');
  }

  Future<List<User>> getUser() async {
    List<User> _user = [];

    var db = await this.database;
    var result = await db.query(tableAlarm);
    result.forEach((element) {
      var alarm = User.fromJson(element);
      _user.add(alarm);
    });

    return _user;
  }

  Future<int> updatePending(int id, int isPending) async {
    var db = await this.database;
    var values = <String, dynamic>{
      columnPending: isPending,
    };
    return await db
        .update(tableAlarm, values, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    var db = await this.database;
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }

  void insertAlarm(Alarm alarm) async {
    var db = await this.database;
    var result = await db.insert(tableAlarm, alarm.toJson());
    print('result : $result');
  }
}
