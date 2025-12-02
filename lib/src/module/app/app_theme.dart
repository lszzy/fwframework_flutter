import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    required this.primaryColor,
    required this.primaryDarkColor,
    required this.primaryDisabledColor,
    required this.primaryLightColor,
    required this.successColor,
    required this.successDarkColor,
    required this.successDisabledColor,
    required this.successLightColor,
    required this.warningColor,
    required this.warningDarkColor,
    required this.warningDisabledColor,
    required this.warningLightColor,
    required this.errorColor,
    required this.errorDarkColor,
    required this.errorDisabledColor,
    required this.errorLightColor,
    required this.infoColor,
    required this.infoDarkColor,
    required this.infoDisabledColor,
    required this.infoLightColor,
    required this.whiteColor,
    required this.blackColor,
    required this.mainColor,
    required this.contentColor,
    required this.tipsColor,
    required this.lightColor,
    required this.borderColor,
    required this.dividerColor,
    required this.maskColor,
    required this.shadowColor,
    required this.bgColor,
    required this.bgWhiteColor,
    required this.bgBlackColor,
    required this.bgGrayLightColor,
    required this.bgGrayDarkColor,
  });

  final Color primaryColor;
  final Color primaryDarkColor;
  final Color primaryDisabledColor;
  final Color primaryLightColor;

  final Color successColor;
  final Color successDarkColor;
  final Color successDisabledColor;
  final Color successLightColor;

  final Color warningColor;
  final Color warningDarkColor;
  final Color warningDisabledColor;
  final Color warningLightColor;

  final Color errorColor;
  final Color errorDarkColor;
  final Color errorDisabledColor;
  final Color errorLightColor;

  final Color infoColor;
  final Color infoDarkColor;
  final Color infoDisabledColor;
  final Color infoLightColor;

  final Color whiteColor;
  final Color blackColor;
  final Color mainColor;
  final Color contentColor;
  final Color tipsColor;
  final Color lightColor;
  final Color borderColor;
  final Color dividerColor;
  final Color maskColor;
  final Color shadowColor;
  final Color bgColor;
  final Color bgWhiteColor;
  final Color bgBlackColor;
  final Color bgGrayLightColor;
  final Color bgGrayDarkColor;

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? primaryColor,
    Color? primaryDarkColor,
    Color? primaryDisabledColor,
    Color? primaryLightColor,
    Color? successColor,
    Color? successDarkColor,
    Color? successDisabledColor,
    Color? successLightColor,
    Color? warningColor,
    Color? warningDarkColor,
    Color? warningDisabledColor,
    Color? warningLightColor,
    Color? errorColor,
    Color? errorDarkColor,
    Color? errorDisabledColor,
    Color? errorLightColor,
    Color? infoColor,
    Color? infoDarkColor,
    Color? infoDisabledColor,
    Color? infoLightColor,
    Color? whiteColor,
    Color? blackColor,
    Color? mainColor,
    Color? contentColor,
    Color? tipsColor,
    Color? lightColor,
    Color? borderColor,
    Color? dividerColor,
    Color? maskColor,
    Color? shadowColor,
    Color? bgColor,
    Color? bgWhiteColor,
    Color? bgBlackColor,
    Color? bgGrayLightColor,
    Color? bgGrayDarkColor,
  }) {
    return AppTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      primaryDarkColor: primaryDarkColor ?? this.primaryDarkColor,
      primaryDisabledColor: primaryDisabledColor ?? this.primaryDisabledColor,
      primaryLightColor: primaryLightColor ?? this.primaryLightColor,
      successColor: successColor ?? this.successColor,
      successDarkColor: successDarkColor ?? this.successDarkColor,
      successDisabledColor: successDisabledColor ?? this.successDisabledColor,
      successLightColor: successLightColor ?? this.successLightColor,
      warningColor: warningColor ?? this.warningColor,
      warningDarkColor: warningDarkColor ?? this.warningDarkColor,
      warningDisabledColor: warningDisabledColor ?? this.warningDisabledColor,
      warningLightColor: warningLightColor ?? this.warningLightColor,
      errorColor: errorColor ?? this.errorColor,
      errorDarkColor: errorDarkColor ?? this.errorDarkColor,
      errorDisabledColor: errorDisabledColor ?? this.errorDisabledColor,
      errorLightColor: errorLightColor ?? this.errorLightColor,
      infoColor: infoColor ?? this.infoColor,
      infoDarkColor: infoDarkColor ?? this.infoDarkColor,
      infoDisabledColor: infoDisabledColor ?? this.infoDisabledColor,
      infoLightColor: infoLightColor ?? this.infoLightColor,
      whiteColor: whiteColor ?? this.whiteColor,
      blackColor: blackColor ?? this.blackColor,
      mainColor: mainColor ?? this.mainColor,
      contentColor: contentColor ?? this.contentColor,
      tipsColor: tipsColor ?? this.tipsColor,
      lightColor: lightColor ?? this.lightColor,
      borderColor: borderColor ?? this.borderColor,
      dividerColor: dividerColor ?? this.dividerColor,
      maskColor: maskColor ?? this.maskColor,
      shadowColor: shadowColor ?? this.shadowColor,
      bgColor: bgColor ?? this.bgColor,
      bgWhiteColor: bgWhiteColor ?? this.bgWhiteColor,
      bgBlackColor: bgBlackColor ?? this.bgBlackColor,
      bgGrayLightColor: bgGrayLightColor ?? this.bgGrayLightColor,
      bgGrayDarkColor: bgGrayDarkColor ?? this.bgGrayDarkColor,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      primaryDarkColor: Color.lerp(
        primaryDarkColor,
        other.primaryDarkColor,
        t,
      )!,
      primaryDisabledColor: Color.lerp(
        primaryDisabledColor,
        other.primaryDisabledColor,
        t,
      )!,
      primaryLightColor: Color.lerp(
        primaryLightColor,
        other.primaryLightColor,
        t,
      )!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      successDarkColor: Color.lerp(
        successDarkColor,
        other.successDarkColor,
        t,
      )!,
      successDisabledColor: Color.lerp(
        successDisabledColor,
        other.successDisabledColor,
        t,
      )!,
      successLightColor: Color.lerp(
        successLightColor,
        other.successLightColor,
        t,
      )!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      warningDarkColor: Color.lerp(
        warningDarkColor,
        other.warningDarkColor,
        t,
      )!,
      warningDisabledColor: Color.lerp(
        warningDisabledColor,
        other.warningDisabledColor,
        t,
      )!,
      warningLightColor: Color.lerp(
        warningLightColor,
        other.warningLightColor,
        t,
      )!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      errorDarkColor: Color.lerp(
        errorDarkColor,
        other.errorDarkColor,
        t,
      )!,
      errorDisabledColor: Color.lerp(
        errorDisabledColor,
        other.errorDisabledColor,
        t,
      )!,
      errorLightColor: Color.lerp(
        errorLightColor,
        other.errorLightColor,
        t,
      )!,
      infoColor: Color.lerp(infoColor, other.infoColor, t)!,
      infoDarkColor: Color.lerp(infoDarkColor, other.infoDarkColor, t)!,
      infoDisabledColor: Color.lerp(
        infoDisabledColor,
        other.infoDisabledColor,
        t,
      )!,
      infoLightColor: Color.lerp(
        infoLightColor,
        other.infoLightColor,
        t,
      )!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      blackColor: Color.lerp(blackColor, other.blackColor, t)!,
      mainColor: Color.lerp(mainColor, other.mainColor, t)!,
      contentColor: Color.lerp(contentColor, other.contentColor, t)!,
      tipsColor: Color.lerp(tipsColor, other.tipsColor, t)!,
      lightColor: Color.lerp(lightColor, other.lightColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      maskColor: Color.lerp(maskColor, other.maskColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      bgColor: Color.lerp(bgColor, other.bgColor, t)!,
      bgWhiteColor: Color.lerp(bgWhiteColor, other.bgWhiteColor, t)!,
      bgBlackColor: Color.lerp(bgBlackColor, other.bgBlackColor, t)!,
      bgGrayLightColor: Color.lerp(
        bgGrayLightColor,
        other.bgGrayLightColor,
        t,
      )!,
      bgGrayDarkColor: Color.lerp(
        bgGrayDarkColor,
        other.bgGrayDarkColor,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! AppTheme) {
      return false;
    }

    return other.runtimeType == runtimeType &&
        other.primaryColor == primaryColor &&
        other.primaryDarkColor == primaryDarkColor &&
        other.primaryDisabledColor == primaryDisabledColor &&
        other.primaryLightColor == primaryLightColor &&
        other.successColor == successColor &&
        other.successDarkColor == successDarkColor &&
        other.successDisabledColor == successDisabledColor &&
        other.successLightColor == successLightColor &&
        other.warningColor == warningColor &&
        other.warningDarkColor == warningDarkColor &&
        other.warningDisabledColor == warningDisabledColor &&
        other.warningLightColor == warningLightColor &&
        other.errorColor == errorColor &&
        other.errorDarkColor == errorDarkColor &&
        other.errorDisabledColor == errorDisabledColor &&
        other.errorLightColor == errorLightColor &&
        other.infoColor == infoColor &&
        other.infoDarkColor == infoDarkColor &&
        other.infoDisabledColor == infoDisabledColor &&
        other.infoLightColor == infoLightColor &&
        other.whiteColor == whiteColor &&
        other.blackColor == blackColor &&
        other.mainColor == mainColor &&
        other.contentColor == contentColor &&
        other.tipsColor == tipsColor &&
        other.lightColor == lightColor &&
        other.borderColor == borderColor &&
        other.dividerColor == dividerColor &&
        other.maskColor == maskColor &&
        other.shadowColor == shadowColor &&
        other.bgColor == bgColor &&
        other.bgWhiteColor == bgWhiteColor &&
        other.bgBlackColor == bgBlackColor &&
        other.bgGrayLightColor == bgGrayLightColor &&
        other.bgGrayDarkColor == bgGrayDarkColor;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType,
      primaryColor,
      primaryDarkColor,
      primaryDisabledColor,
      primaryLightColor,
      successColor,
      successDarkColor,
      successDisabledColor,
      successLightColor,
      warningColor,
      warningDarkColor,
      warningDisabledColor,
      warningLightColor,
      errorColor,
      errorDarkColor,
      errorDisabledColor,
      errorLightColor,
      infoColor,
      infoDarkColor,
      infoDisabledColor,
      infoLightColor,
      whiteColor,
      blackColor,
      mainColor,
      contentColor,
      tipsColor,
      lightColor,
      borderColor,
      dividerColor,
      maskColor,
      shadowColor,
      bgColor,
      bgWhiteColor,
      bgBlackColor,
      bgGrayLightColor,
      bgGrayDarkColor,
    ]);
  }
}

extension AppThemeBuildContext on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
}
