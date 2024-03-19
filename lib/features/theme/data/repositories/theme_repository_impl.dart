import 'package:dynamic_theme/features/theme/domain/repositories/theme_repository.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final StorageService storageService;

  ThemeRepositoryImpl(this.storageService) : super(storageService);

  @override
  Future<ThemeMode> getTheme() async {
    return storageService.getTheme();
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    return storageService.setTheme(theme);
  }
}
