import 'dart:async';

import 'package:dynamic_theme/features/theme/data/repositories/theme_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/shared_preference_providers.dart';

final themeProviderRepository = Provider((ref) {
  final storageService = ref.watch(sharedPreferenceProvider);
  return ThemeRepositoryImpl(storageService);
});

class AsyncThemeNotifier extends AsyncNotifier<ThemeMode> {
  AsyncThemeNotifier();

  @override
  FutureOr<ThemeMode> build() {
    state = const AsyncValue.loading();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final theme = await ref.watch(themeProviderRepository).getTheme();
    state = AsyncValue.data(theme);
  }

  Future<void> toggleTheme() async {
    final currentTheme = state.value;
    if(currentTheme == null) return;
    final newTheme = currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = const AsyncValue.loading();
    try {
      await ref.watch(themeProviderRepository).setTheme(newTheme);
      state = AsyncValue.data(newTheme);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
  }
}
