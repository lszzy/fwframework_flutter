import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
      _sharedPreferences = await SharedPreferencesWithCache.create(
        sharedPreferencesOptions: sharedPreferencesOptions,
        cacheOptions: cacheOptions,
        cache: cache,
      );
      _secureStorage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));
      _instance = StorageService._();
    }
    return _instance!;
  }

  static SharedPreferencesWithCache? _sharedPreferences;

  SharedPreferencesWithCache get sharedPreferences {
    return _sharedPreferences!;
  }

  Object? get(String key) {
    return sharedPreferences.get(key);
  }

  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  List<String>? getStringList(String key) {
    return sharedPreferences.getStringList(key);
  }

  /// 设置值到平台缓存，如果类型不支持，会抛出ArgumentError
  Future<void> setValue(String key, Object? value) async {
    return await sharedPreferences.setValue(key, value);
  }

  Future<void> setBool(String key, bool? value) async {
    if (value == null) {
      return await sharedPreferences.remove(key);
    }
    return await sharedPreferences.setBool(key, value);
  }

  Future<void> setInt(String key, int? value) async {
    if (value == null) {
      return await sharedPreferences.remove(key);
    }
    return await sharedPreferences.setInt(key, value);
  }

  Future<void> setDouble(String key, double? value) async {
    if (value == null) {
      return await sharedPreferences.remove(key);
    }
    return await sharedPreferences.setDouble(key, value);
  }

  Future<void> setString(String key, String? value) async {
    if (value == null) {
      return await sharedPreferences.remove(key);
    }
    return await sharedPreferences.setString(key, value);
  }

  Future<void> setStringList(String key, List<String>? value) async {
    if (value == null) {
      return await sharedPreferences.remove(key);
    }
    return await sharedPreferences.setStringList(key, value);
  }

  static FlutterSecureStorage? _secureStorage;

  FlutterSecureStorage get secureStorage {
    return _secureStorage!;
  }

  Future<void> setSecureString(String key, String? value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> getSecureString(String key) {
    return secureStorage.read(key: key);
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
