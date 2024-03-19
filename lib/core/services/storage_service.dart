import 'package:flutter/material.dart';

abstract class StorageService {
  Future<void> setTheme(ThemeMode theme);
  Future<ThemeMode> getTheme();
}
