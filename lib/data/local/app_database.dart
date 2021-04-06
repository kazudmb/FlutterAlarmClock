import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final String tableAlarm = 'alarm';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnDateTime = 'alarmDateTime';
  final String columnPending = 'isPending';
  final String columnColorIndex = 'gradientColorIndex';
  final String columnRepeat = 'repeat';

  Database? _database;

  // singleton
  static final AppDatabase _cache = AppDatabase._internal();
  factory AppDatabase() {
    return _cache;
  }
  AppDatabase._internal();

  var logger = Logger();

  Future<Database> getDatabase() async {
    logger.d('called getDatabase()');
    return _database ??= await _initializeDatabase();
  }

  Future<Database> _initializeDatabase() async {
    logger.d('called _initializeDatabase()');
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
}
