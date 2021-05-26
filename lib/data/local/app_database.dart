import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  /// User
  final String tableUser = 'user';
  final String columnUserId = 'userId';
  final String columnAlarm = 'alarm';

  /// Alarm
  final String tableAlarm = 'alarm';
  final String columnAlarmId = 'alarmId';
  final String columnTitle = 'title';
  final String columnAlarmDateTime = 'alarmDateTime';
  final String columnPending = 'isPending';
  final String columnRepeat = 'repeat';

  /// Timer
  final String tableTimer = 'timer';
  final String columnTimerId = 'timerId';
  final String columnTimerDateTime = 'timerDateTime';

  Database? _database;

  // singleton
  static final AppDatabase _cache = AppDatabase._internal();
  factory AppDatabase() {
    return _cache;
  }
  AppDatabase._internal();

  var logger = Logger();

  Future<Database> getDatabase() async {
    return _database ??= await _initializeDatabase();
  }

  Future<Database> _initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "light_alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableUser ( 
          $columnUserId integer primary key autoincrement)
        ''');
        db.execute('''
          create table $tableAlarm ( 
          $columnUserId integer,
          $columnAlarmId integer primary key autoincrement, 
          $columnTitle text not null,
          $columnAlarmDateTime text not null,
          $columnPending integer not null,
          $columnRepeat text not null)
        ''');
        db.execute('''
          create table $tableTimer ( 
          $columnUserId integer,
          $columnTimerId integer primary key, 
          $columnTimerDateTime text not null)
        ''');
      },
    );
    return database;
  }
}
