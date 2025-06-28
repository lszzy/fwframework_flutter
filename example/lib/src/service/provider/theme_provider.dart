import 'package:example/src/service/manager/preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeNotifier.themeMode);

  static ThemeMode get themeMode {
    final themeMode = PreferenceManager.instance.getString('ThemeMode');
    return ThemeMode.values.firstWhere(
      (e) => e.name == themeMode,
      orElse: () => ThemeMode.system,
    );
  }

  void setThemeMode(ThemeMode themeMode) {
    state = themeMode;
    PreferenceManager.instance.setString('ThemeMode', themeMode.name);
  }
}
