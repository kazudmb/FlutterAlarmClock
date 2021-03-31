import 'package:flutter/material.dart';
import 'package:light_alarm/data/local/user_data_source.dart';
import 'package:light_alarm/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  final UserDataSource _userDataSource;

  @override
  Future<ThemeMode?> loadThemeMode() {
    return _userDataSource.loadThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) {
    return _userDataSource.saveThemeMode(theme);
  }
}
