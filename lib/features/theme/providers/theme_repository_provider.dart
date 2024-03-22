import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/shared_preference_providers.dart';
import '../data/repositories/theme_repository_impl.dart';

final themeProviderRepository = Provider((ref) {
  final storageService = ref.watch(sharedPreferenceProvider);
  return ThemeRepositoryImpl(storageService);
});
