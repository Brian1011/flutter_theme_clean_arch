import 'package:flutter/material.dart';

import '../repositories/repositories.dart';

class GetThemeUseCase {
  final ThemeRepository _themeRepository;

  GetThemeUseCase(this._themeRepository);

  Future<ThemeMode> call() async {
    return _themeRepository.getTheme();
  }
}
