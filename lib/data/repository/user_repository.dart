import 'package:flutter/material.dart';

abstract class UserRepository {
  Future<ThemeMode?> loadThemeMode();
  Future<void> saveThemeMode(ThemeMode theme);
}