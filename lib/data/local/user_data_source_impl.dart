import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:light_alarm/data/local/user_data_source.dart';

import 'app_shared_preferences.dart';

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this._prefs);

  static const String keyThemeMode = 'theme_mode';

  final AppSharedPreferences _prefs;

  @override
  Future<ThemeMode?> loadThemeMode() async {
    final prefs = await _prefs.getInstance();
    return EnumToString.fromString(
        ThemeMode.values, prefs.getString(keyThemeMode)!);
  }

  @override
  Future<void> saveThemeMode(ThemeMode? theme) async {
    final prefs = await _prefs.getInstance();
    prefs.setString(keyThemeMode, EnumToString.convertToString(theme));
  }
}