import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core.dart';

class SharedPreferencesStorageService implements StorageService {
  @override
  Future<ThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    if (theme == 'ThemeMode.dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    final prefs = SharedPreferences.getInstance();
    await prefs.then((value) => value.setString('theme', theme.toString()));
  }
}
