import 'dart:async';

import 'package:dynamic_theme/features/theme/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncThemeNotifierProvider =
    AsyncNotifierProvider<AsyncThemeNotifier, ThemeMode>(() {
  return AsyncThemeNotifier();
});

class AsyncThemeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  ThemeMode build() {
    _loadTheme();
    return state.value ?? ThemeMode.system;
  }

  Future<void> _loadTheme() async {
    state = const AsyncValue.loading();
    final theme = await ref.read(getThemeUseCaseProvider).call();
    state = AsyncValue.data(theme);
  }

  Future<void> toggleTheme() async {
    final currentTheme = state.value;
    if (currentTheme == null) return;
    final newTheme =
        currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = const AsyncValue.loading();
    try {
      await ref.read(setThemeUseCaseProvider).call(newTheme);
      state = AsyncValue.data(newTheme);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
