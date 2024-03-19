import 'package:flutter/material.dart';

import '../../../../core/core.dart';

abstract class ThemeRepository {
  final StorageService storageService;
  ThemeRepository(this.storageService);

  Future<void> setTheme(ThemeMode theme);
  Future<ThemeMode> getTheme();
}
