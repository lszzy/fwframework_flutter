import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fwframework_flutter/src/service/storage_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeService.themeMode);

  void setThemeMode(ThemeMode themeMode) {
    emit(themeMode);
    ThemeService.setThemeMode(themeMode);
  }
}

class ThemeService {
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
