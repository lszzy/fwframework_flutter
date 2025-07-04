import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwframework_flutter/src/service/storage_service.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeService.themeMode);

  void setThemeMode(ThemeMode themeMode) {
    state = themeMode;
    ThemeService.setThemeMode(themeMode);
  }
}

class ThemeService {
  static final themeProvider =
      StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
    return ThemeNotifier();
  });

  static ThemeMode get themeMode {
    final themeName = StorageService.instance.getString('AppTheme');
    return ThemeMode.values.firstWhere(
      (e) => e.name == themeName,
      orElse: () => ThemeMode.system,
    );
  }

  static void setThemeMode(ThemeMode themeMode) {
    StorageService.instance.setString('AppTheme', themeMode.name);
  }
}
