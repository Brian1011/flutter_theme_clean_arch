import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/usecases/usecases.dart';
import 'theme_repository_provider.dart';

final getThemeUseCaseProvider = Provider((ref) {
  final themeRepository = ref.watch(themeProviderRepository);
  return GetThemeUseCase(themeRepository);
});
