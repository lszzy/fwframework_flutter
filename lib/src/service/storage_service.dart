import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static StorageService get instance {
    assert(
      _instance != null,
      'StorageService has not been initialized. Call await StorageService.ensureInitialized() before accessing the instance.',
    );
    return _instance!;
  }

  factory StorageService() => instance;

  static StorageService? _instance;
  StorageService._();

  static Future<StorageService> ensureInitialized({
    SharedPreferencesOptions sharedPreferencesOptions =
        const SharedPreferencesOptions(),
    SharedPreferencesWithCacheOptions cacheOptions =
        const SharedPreferencesWithCacheOptions(),
    Map<String, Object?>? cache,
  }) async {
    if (_instance == null) {
      _preferences = await SharedPreferencesWithCache.create(
        sharedPreferencesOptions: sharedPreferencesOptions,
        cacheOptions: cacheOptions,
        cache: cache,
      );
      _instance = StorageService._();
    }
    return _instance!;
  }

  static SharedPreferencesWithCache? _preferences;

  SharedPreferencesWithCache get preferences {
    return _preferences!;
  }

  Object? get(String key) {
    return preferences.get(key);
  }

  bool? getBool(String key) {
    return preferences.getBool(key);
  }

  int? getInt(String key) {
    return preferences.getInt(key);
  }

  double? getDouble(String key) {
    return preferences.getDouble(key);
  }

  String? getString(String key) {
    return preferences.getString(key);
  }

  List<String>? getStringList(String key) {
    return preferences.getStringList(key);
  }

  /// 设置值到平台缓存，如果类型不支持，会抛出ArgumentError
  Future<void> setValue(String key, Object? value) async {
    return await preferences.setValue(key, value);
  }

  Future<void> setBool(String key, bool? value) async {
    if (value == null) {
      return await preferences.remove(key);
    }
    return await preferences.setBool(key, value);
  }

  Future<void> setInt(String key, int? value) async {
    if (value == null) {
      return await preferences.remove(key);
    }
    return await preferences.setInt(key, value);
  }

  Future<void> setDouble(String key, double? value) async {
    if (value == null) {
      return await preferences.remove(key);
    }
    return await preferences.setDouble(key, value);
  }

  Future<void> setString(String key, String? value) async {
    if (value == null) {
      return await preferences.remove(key);
    }
    return await preferences.setString(key, value);
  }

  Future<void> setStringList(String key, List<String>? value) async {
    if (value == null) {
      return await preferences.remove(key);
    }
    return await preferences.setStringList(key, value);
  }
}

extension SharedPreferencesWithCacheExtension on SharedPreferencesWithCache {
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
