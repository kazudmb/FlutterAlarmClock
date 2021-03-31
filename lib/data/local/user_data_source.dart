import 'package:flutter/material.dart';

abstract class UserDataSource {
  Future<ThemeMode?> loadThemeMode();

  Future<void> saveThemeMode(ThemeMode? theme);
}
