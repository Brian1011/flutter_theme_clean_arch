import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/shared_preference_providers.dart';
import '../data/repositories/theme_repository_impl.dart';

final themeProviderRepository = Provider((ref) {
  final storageService = ref.watch(sharedPreferenceProvider);
  return ThemeRepositoryImpl(storageService);
});

final asyncThemeNotifierProvider = AsyncNotifierProvider<AsyncThemeNotifier, ThemeMode>(() {
  return AsyncThemeNotifier();
});

class AsyncThemeNotifier extends AsyncNotifier<ThemeMode> {
  AsyncThemeNotifier() {
    _loadTheme();
  }

  @override
  ThemeMode build() {
    return state.value ?? ThemeMode.system;
  }

  Future<void> _loadTheme() async {
    state = const AsyncValue.loading();
    final theme = await ref.watch(themeProviderRepository).getTheme();
    state = AsyncValue.data(theme);
  }

  Future<void> toggleTheme() async {
    final currentTheme = state.value;
    if (currentTheme == null) return;
    final newTheme = currentTheme == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    state = const AsyncValue.loading();
    try {
      await ref.watch(themeProviderRepository).setTheme(newTheme);
      state = AsyncValue.data(newTheme);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
