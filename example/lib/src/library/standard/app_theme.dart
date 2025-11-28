import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_theme.g.theme.dart';

@ThemeExtensions()
class AppTheme extends ThemeExtension<AppTheme> with _$AppThemeMixin {
  const AppTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.spacing,
    this.borderRadius,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final double spacing;
  final BorderRadius? borderRadius;

  static final AppTheme light = AppTheme(
    primaryColor: Colors.black,
    secondaryColor: Colors.green,
    spacing: 16.0,
    borderRadius: BorderRadius.circular(8.0),
  );

  static final AppTheme dark = AppTheme(
    primaryColor: Colors.white,
    secondaryColor: Colors.teal,
    spacing: 16.0,
    borderRadius: BorderRadius.circular(8.0),
  );
}
