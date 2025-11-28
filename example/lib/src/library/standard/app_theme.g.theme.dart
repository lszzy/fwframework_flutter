// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_theme.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$AppThemeMixin on ThemeExtension<AppTheme> {
  @override
  ThemeExtension<AppTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    double? spacing,
    BorderRadius? borderRadius,
  }) {
    final _this = (this as AppTheme);

    return AppTheme(
      primaryColor: primaryColor ?? _this.primaryColor,
      secondaryColor: secondaryColor ?? _this.secondaryColor,
      spacing: spacing ?? _this.spacing,
      borderRadius: borderRadius ?? _this.borderRadius,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }

    final _this = (this as AppTheme);

    return AppTheme(
      primaryColor: Color.lerp(_this.primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(
        _this.secondaryColor,
        other.secondaryColor,
        t,
      )!,
      spacing: lerpDouble$(_this.spacing, other.spacing, t)!,
      borderRadius: BorderRadius.lerp(
        _this.borderRadius,
        other.borderRadius,
        t,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as AppTheme);
    final _other = (other as AppTheme);

    return _other.primaryColor == _this.primaryColor &&
        _other.secondaryColor == _this.secondaryColor &&
        _other.spacing == _this.spacing &&
        _other.borderRadius == _this.borderRadius;
  }

  @override
  int get hashCode {
    final _this = (this as AppTheme);

    return Object.hash(
      runtimeType,
      _this.primaryColor,
      _this.secondaryColor,
      _this.spacing,
      _this.borderRadius,
    );
  }
}

extension AppThemeBuildContext on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
