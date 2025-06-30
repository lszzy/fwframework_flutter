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

  static Future<SharedPreferencesWithCache> ensureInitialized({
    SharedPreferencesOptions sharedPreferencesOptions =
        const SharedPreferencesOptions(),
    SharedPreferencesWithCacheOptions cacheOptions =
        const SharedPreferencesWithCacheOptions(),
    Map<String, Object?>? cache,
  }) async {
    _instance ??= await SharedPreferencesWithCache.create(
      sharedPreferencesOptions: sharedPreferencesOptions,
      cacheOptions: cacheOptions,
      cache: cache,
    );
    return _instance!;
  }
}

extension SharedPreferencesWithCacheExtension on SharedPreferencesWithCache {
  /// 设置值到平台缓存，如果类型不支持，会抛出ArgumentError
  Future<void> setValue(String key, Object? value) async {
    if (value == null) {
      return remove(key);
    } else if (value is bool) {
      return setBool(key, value);
    } else if (value is int) {
      return setInt(key, value);
    } else if (value is double) {
      return setDouble(key, value);
    } else if (value is String) {
      return setString(key, value);
    } else if (value is List<String>) {
      return setStringList(key, value);
    } else {
      throw ArgumentError(
          '$value for $key is not supported by SharedPreferencesWithCache');
    }
  }
}
