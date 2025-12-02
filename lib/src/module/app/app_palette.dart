import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fwframework_flutter/src/module/app/app_theme.dart';

class AppPalette {
  static AppTheme lightTheme = lightPalette;

  static AppTheme darkTheme = darkPalette;

  static double paletteRatio = 0.6;

  static const AppTheme lightPalette = AppTheme(
    primaryColor: Color(0xff2979ff),
    primaryDarkColor: Color(0xff2b85e4),
    primaryDisabledColor: Color(0xffa0cfff),
    primaryLightColor: Color(0xffecf5ff),
    successColor: Color(0xff19be6b),
    successDarkColor: Color(0xff18b566),
    successDisabledColor: Color(0xff71d5a1),
    successLightColor: Color(0xffdbf1e1),
    warningColor: Color(0xffff9900),
    warningDarkColor: Color(0xfff29100),
    warningDisabledColor: Color(0xfffcbd71),
    warningLightColor: Color(0xfffdf6ec),
    errorColor: Color(0xfffa3534),
    errorDarkColor: Color(0xffdd6161),
    errorDisabledColor: Color(0xfffab6b6),
    errorLightColor: Color(0xfffef0f0),
    infoColor: Color(0xff909399),
    infoDarkColor: Color(0xff82848a),
    infoDisabledColor: Color(0xffc8c9cc),
    infoLightColor: Color(0xfff4f4f5),
    whiteColor: Color(0xffffffff),
    blackColor: Color(0xff000000),
    mainColor: Color(0xff303133),
    contentColor: Color(0xff606266),
    tipsColor: Color(0xff909399),
    lightColor: Color(0xffc0c4cc),
    borderColor: Color(0xffdcdfe6),
    dividerColor: Color(0xffe4e7ed),
    maskColor: Color.from(alpha: 0.4, red: 0, green: 0, blue: 0),
    shadowColor: Color.from(alpha: 0.1, red: 0, green: 0, blue: 0),
    bgColor: Color(0xfff3f4f6),
    bgWhiteColor: Color(0xffffffff),
    bgBlackColor: Color(0xff000000),
    bgGrayLightColor: Color(0xfff5f7fa),
    bgGrayDarkColor: Color(0xff2f343c),
  );

  static const AppTheme darkPalette = AppTheme(
    primaryColor: Color(0xff8ab4ff),
    primaryDarkColor: Color(0xff5f8dff),
    primaryDisabledColor: Color(0xff3d4f74),
    primaryLightColor: Color(0xff1d273f),
    successColor: Color(0xff4ade80),
    successDarkColor: Color(0xff1f9d57),
    successDisabledColor: Color(0xff2f4d3d),
    successLightColor: Color(0xff10291f),
    warningColor: Color(0xfffbbf24),
    warningDarkColor: Color(0xffc88f00),
    warningDisabledColor: Color(0xff4a3b17),
    warningLightColor: Color(0xff2b1f05),
    errorColor: Color(0xffff6b6b),
    errorDarkColor: Color(0xffd83a3a),
    errorDisabledColor: Color(0xff4f2323),
    errorLightColor: Color(0xff2d1414),
    infoColor: Color(0xffa0a7b8),
    infoDarkColor: Color(0xff7c8394),
    infoDisabledColor: Color(0xff3b3f4c),
    infoLightColor: Color(0xff1d2029),
    whiteColor: Color(0xfff5f6f7),
    blackColor: Color(0xfff5f6f7),
    mainColor: Color(0xfff5f6f7),
    contentColor: Color(0xffcfd3dc),
    tipsColor: Color(0xff9aa1af),
    lightColor: Color(0xff6b7082),
    borderColor: Color(0xff3a4251),
    dividerColor: Color(0xff3a4251),
    maskColor: Color.from(alpha: 0.6, red: 0, green: 0, blue: 0),
    shadowColor: Color.from(alpha: 0.3, red: 0, green: 0, blue: 0),
    bgColor: Color(0xff111827),
    bgWhiteColor: Color(0xff000000),
    bgBlackColor: Color(0xffffffff),
    bgGrayLightColor: Color(0xff1a1a1a),
    bgGrayDarkColor: Color(0xfff5f7fa),
  );

  static AppTheme purplePalette = lightPalette.copyWith(
    primaryColor: const Color(0xff7c3aed),
    primaryDarkColor: const Color(0xff6d28d9),
    primaryDisabledColor: const Color(0xffc4b5fd),
    primaryLightColor: const Color(0xfff3e8ff),
    successColor: const Color(0xff10b981),
    successDarkColor: const Color(0xff059669),
    successDisabledColor: const Color(0xffa7f3d0),
    successLightColor: const Color(0xffd1fae5),
    warningColor: const Color(0xfff59e0b),
    warningDarkColor: const Color(0xffd97706),
    warningDisabledColor: const Color(0xfffde68a),
    warningLightColor: const Color(0xfffef3c7),
    errorColor: const Color(0xfff43f5e),
    errorDarkColor: const Color(0xffe11d48),
    errorDisabledColor: const Color(0xfffbcfe8),
    errorLightColor: const Color(0xffffe4e6),
    infoColor: const Color(0xff6b7280),
    infoDarkColor: const Color(0xff4b5563),
    infoDisabledColor: const Color(0xffd1d5db),
    infoLightColor: const Color(0xfff3f4f6),
  );

  static AppTheme greenPalette = lightPalette.copyWith(
    primaryColor: const Color(0xff059669),
    primaryDarkColor: const Color(0xff047857),
    primaryDisabledColor: const Color(0xff6ee7b7),
    primaryLightColor: const Color(0xffecfdf5),
    successColor: const Color(0xff16a34a),
    successDarkColor: const Color(0xff15803d),
    successDisabledColor: const Color(0xff86efac),
    successLightColor: const Color(0xffdcfce7),
    warningColor: const Color(0xffeab308),
    warningDarkColor: const Color(0xffca8a04),
    warningDisabledColor: const Color(0xfffacc15),
    warningLightColor: const Color(0xfffefce8),
    errorColor: const Color(0xffdc2626),
    errorDarkColor: const Color(0xffb91c1c),
    errorDisabledColor: const Color(0xfffca5a5),
    errorLightColor: const Color(0xfffee2e2),
    infoColor: const Color(0xff78716c),
    infoDarkColor: const Color(0xff57534e),
    infoDisabledColor: const Color(0xffe7e5e4),
    infoLightColor: const Color(0xfffafaf9),
  );

  static AppTheme orangePalette = lightPalette.copyWith(
    primaryColor: const Color(0xfff97316),
    primaryDarkColor: const Color(0xffea580c),
    primaryDisabledColor: const Color(0xfffed7aa),
    primaryLightColor: const Color(0xffffedd5),
    successColor: const Color(0xff22c55e),
    successDarkColor: const Color(0xff16a34a),
    successDisabledColor: const Color(0xff86efac),
    successLightColor: const Color(0xffdcfce7),
    warningColor: const Color(0xfffbbf24),
    warningDarkColor: const Color(0xfff59e0b),
    warningDisabledColor: const Color(0xfffde68a),
    warningLightColor: const Color(0xfffef3c7),
    errorColor: const Color(0xffef4444),
    errorDarkColor: const Color(0xffdc2626),
    errorDisabledColor: const Color(0xfffecaca),
    errorLightColor: const Color(0xfffee2e2),
    infoColor: const Color(0xff6366f1),
    infoDarkColor: const Color(0xff4f46e5),
    infoDisabledColor: const Color(0xffc7d2fe),
    infoLightColor: const Color(0xffe0e7ff),
  );

  static AppTheme bluePalette = lightPalette.copyWith(
    primaryColor: const Color(0xff0b3d91),
    primaryDarkColor: const Color(0xff062a57),
    primaryDisabledColor: const Color(0xff274a7a),
    primaryLightColor: const Color(0xff081a33),
    successColor: const Color(0xff66bb6a),
    successDarkColor: const Color(0xff2e7d32),
    successDisabledColor: const Color(0xff81c784),
    successLightColor: const Color(0xff1b3a1b),
    warningColor: const Color(0xffffa726),
    warningDarkColor: const Color(0xffe65100),
    warningDisabledColor: const Color(0xffffb74d),
    warningLightColor: const Color(0xff663c00),
    errorColor: const Color(0xffef5350),
    errorDarkColor: const Color(0xffc62828),
    errorDisabledColor: const Color(0xffef9a9a),
    errorLightColor: const Color(0xff5e1914),
    infoColor: const Color(0xff2196f3),
    infoDarkColor: const Color(0xff01579b),
    infoDisabledColor: const Color(0xff4fc3f7),
    infoLightColor: const Color(0xff003d66),
  );

  static AppTheme paletteTheme({
    required AppTheme lightTheme,
    AppTheme? darkTheme,
  }) {
    final paletteTheme = darkTheme ?? darkPalette;
    return paletteTheme.copyWith(
      primaryColor: paletteColor(
        light: lightTheme.primaryColor,
        dark: paletteTheme.primaryColor,
      ),
      primaryDarkColor: paletteColor(
        light: lightTheme.primaryDarkColor,
        dark: paletteTheme.primaryDarkColor,
      ),
      primaryDisabledColor: paletteColor(
        light: lightTheme.primaryDisabledColor,
        dark: paletteTheme.primaryDisabledColor,
      ),
      primaryLightColor: paletteColor(
        light: lightTheme.primaryLightColor,
        dark: paletteTheme.primaryLightColor,
      ),
      successColor: paletteColor(
        light: lightTheme.successColor,
        dark: paletteTheme.successColor,
      ),
      successDarkColor: paletteColor(
        light: lightTheme.successDarkColor,
        dark: paletteTheme.successDarkColor,
      ),
      successDisabledColor: paletteColor(
        light: lightTheme.successDisabledColor,
        dark: paletteTheme.successDisabledColor,
      ),
      successLightColor: paletteColor(
        light: lightTheme.successLightColor,
        dark: paletteTheme.successLightColor,
      ),
      warningColor: paletteColor(
        light: lightTheme.warningColor,
        dark: paletteTheme.warningColor,
      ),
      warningDarkColor: paletteColor(
        light: lightTheme.warningDarkColor,
        dark: paletteTheme.warningDarkColor,
      ),
      warningDisabledColor: paletteColor(
        light: lightTheme.warningDisabledColor,
        dark: paletteTheme.warningDisabledColor,
      ),
      warningLightColor: paletteColor(
        light: lightTheme.warningLightColor,
        dark: paletteTheme.warningLightColor,
      ),
      errorColor: paletteColor(
        light: lightTheme.errorColor,
        dark: paletteTheme.errorColor,
      ),
      errorDarkColor: paletteColor(
        light: lightTheme.errorDarkColor,
        dark: paletteTheme.errorDarkColor,
      ),
      errorDisabledColor: paletteColor(
        light: lightTheme.errorDisabledColor,
        dark: paletteTheme.errorDisabledColor,
      ),
      errorLightColor: paletteColor(
        light: lightTheme.errorLightColor,
        dark: paletteTheme.errorLightColor,
      ),
      infoColor: paletteColor(
        light: lightTheme.infoColor,
        dark: paletteTheme.infoColor,
      ),
      infoDarkColor: paletteColor(
        light: lightTheme.infoDarkColor,
        dark: paletteTheme.infoDarkColor,
      ),
      infoDisabledColor: paletteColor(
        light: lightTheme.infoDisabledColor,
        dark: paletteTheme.infoDisabledColor,
      ),
      infoLightColor: paletteColor(
        light: lightTheme.infoLightColor,
        dark: paletteTheme.infoLightColor,
      ),
    );
  }

  static Color paletteColor({
    required Color light,
    required Color dark,
    double? ratio,
  }) {
    final scale = ratio ?? paletteRatio;
    final red = (1.0 - scale) * light.r + scale * dark.r;
    final green = (1.0 - scale) * light.g + scale * dark.g;
    final blue = (1.0 - scale) * light.b + scale * dark.b;
    return Color.from(
        alpha: 1.0,
        red: max(0, min(red, 1.0)),
        green: max(0, min(green, 1.0)),
        blue: max(0, min(blue, 1.0)));
  }
}
