import 'package:flutter/material.dart';

import '../repositories/repositories.dart';

class SetThemeUseCase {
  final ThemeRepository _themeRepository;

  SetThemeUseCase(this._themeRepository);

  Future<void> call(ThemeMode theme) async {
    return _themeRepository.setTheme(theme);
  }
}
