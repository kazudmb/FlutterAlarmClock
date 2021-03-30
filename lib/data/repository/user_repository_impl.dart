import 'package:light_alarm/constants/constant.dart';
import 'package:light_alarm/model/repository/user_repository.dart';
import 'package:light_alarm/model/user.dart';
import 'package:sqflite/sqflite.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required Database database}) : _database = database;

  final Database _database;

  @override
  Future<User?> getUser() async {
    print('called UserRepositoryImpl getUser()');
    User? _user;
    var db = await this._database;
    var result = await db.query(Constant.tableName);
    result.forEach((element) {
      _user = User.fromJson(element);
    });
    return _user;
  }

  @override
  Future<void> insertUser(User user) async {
    print('called UserRepositoryImpl insertUser()');
    var db = await this._database;
    var result = await db.insert(Constant.tableName, user.toJson());
    print('result : $result');
  }
}
