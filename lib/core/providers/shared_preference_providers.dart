import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/shared_preference_storage_service.dart';

final sharedPreferenceProvider =
    Provider((ref) => SharedPreferencesStorageService());
