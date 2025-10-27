import 'dart:io';

import 'package:mmkv/mmkv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider_foundation/path_provider_foundation.dart';

class MmkvService {
  static MmkvService get instance {
    assert(
      _instance != null,
      'MmkvService has not been initialized. Call await MmkvService.ensureInitialized() before accessing the instance.',
    );
    return _instance!;
  }

  factory MmkvService() => instance;

  static MmkvService? _instance;
  MmkvService._();

  static bool _multiProcess = false;
  static String? _cryptKey;
  static String? _rootDir;

  static Future<String> ensureInitialized({
    bool multiProcess = false,
    String? cryptKey,
    MMKVLogLevel logLevel = MMKVLogLevel.Error,
  }) async {
    if (_instance == null) {
      final groupDir = multiProcess ? (await getGroupDir()) : null;
      _multiProcess = multiProcess;
      _cryptKey = cryptKey;
      _rootDir = await MMKV.initialize(groupDir: groupDir, logLevel: logLevel);
      _instance = MmkvService._();
    }
    return _rootDir!;
  }

  static Future<String?> getGroupDir([String? groupId]) async {
    if (!Platform.isIOS) {
      return null;
    }
    if (groupId == null) {
      final packageInfo = await PackageInfo.fromPlatform();
      groupId = 'group.${packageInfo.packageName}';
    }
    final pathProvider = PathProviderFoundation();
    return await pathProvider.getContainerPath(appGroupIdentifier: groupId);
  }

  MMKV defaultMMKV() {
    return mmkv('default');
  }

  MMKV mmkv(String mmapID) {
    return MMKV(
      mmapID,
      mode: _multiProcess
          ? MMKVMode.MULTI_PROCESS_MODE
          : MMKVMode.SINGLE_PROCESS_MODE,
      cryptKey: _cryptKey,
    );
  }
}
