import 'package:fwframework_flutter/fwframework_flutter.dart';

class PreferenceManager {
  static SharedPreferencesWithCache get instance {
    assert(
      _instance != null,
      'PreferenceManager has not been initialized. Call await PreferenceManager.ensureInitialized() before accessing the instance.',
    );
    return _instance!;
  }

  static SharedPreferencesWithCache? _instance;

  static Future<SharedPreferencesWithCache> ensureInitialized() async {
    _instance ??= await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
    return _instance!;
  }
}
