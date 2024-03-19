import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecases/set_theme_usecase.dart';
import 'theme_provider.dart';

final setThemeUseCaseProvider = Provider((ref) {
  final themeRepository = ref.watch(themeProviderRepository);
  return SetThemeUseCase(themeRepository);
});
