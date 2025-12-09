import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fwframework_flutter/src/service/storage_service.dart';

enum ThemeStyle {
  normal,
  purple,
  green,
  orange,
  blue,
}

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeService.themeMode);

  void setThemeMode(ThemeMode themeMode) {
    emit(themeMode);
    ThemeService.setThemeMode(themeMode);
  }
}

class ThemeStyleCubit extends Cubit<ThemeStyle> {
  ThemeStyleCubit() : super(ThemeService.themeStyle);

  void setThemeStyle(ThemeStyle themeStyle) {
    emit(themeStyle);
    ThemeService.setThemeStyle(themeStyle);
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

  static ThemeStyle defaultStyle = ThemeStyle.normal;

  static ThemeStyle get themeStyle {
    final themeStyle = StorageService.instance.getString('AppStyle');
    return ThemeStyle.values.firstWhere(
      (e) => e.name == themeStyle,
      orElse: () => defaultStyle,
    );
  }

  static void setThemeStyle(ThemeStyle themeStyle) {
    StorageService.instance.setString('AppStyle', themeStyle.name);
  }
}
