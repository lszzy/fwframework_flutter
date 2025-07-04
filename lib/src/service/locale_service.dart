import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwframework_flutter/src/service/storage_service.dart';

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(LocaleService.locale);

  void setLocale(Locale? locale) {
    if (state != locale) {
      state = locale;
      LocaleService.setLocale(locale);
    }
  }
}

class LocaleService {
  static final localeProvider =
      StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
    return LocaleNotifier();
  });

  static Locale? get locale {
    final languageTag = StorageService.instance.getString('AppLocale');
    return fromLanguageTag(languageTag);
  }

  static void setLocale(Locale? locale) {
    StorageService.instance
        .setString('AppLocale', locale?.toLanguageTag() ?? '');
  }

  static Locale? fromLanguageTag(
    String? languageTag, [
    bool isSecondCountryCode = false,
  ]) {
    if (languageTag == null || languageTag.isEmpty) return null;
    final parts = languageTag.split('-');
    if (parts.isEmpty || parts[0].isEmpty) return null;
    final part1 = parts.length > 1 && parts[1].isNotEmpty ? parts[1] : null;
    final part2 = parts.length > 2 && parts[2].isNotEmpty ? parts[2] : null;
    return Locale.fromSubtags(
      languageCode: parts[0],
      scriptCode: (parts.length > 2 || !isSecondCountryCode) ? part1 : null,
      countryCode:
          (parts.length > 2) ? part2 : (isSecondCountryCode ? part1 : null),
    );
  }

  static Locale? supportedLocale(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale == null) return null;
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        if (supportedLocale.scriptCode == null &&
            supportedLocale.countryCode == null) {
          return supportedLocale;
        } else if (supportedLocale.countryCode == null) {
          if (locale.scriptCode == supportedLocale.scriptCode) {
            return supportedLocale;
          }
        } else if (supportedLocale.scriptCode == null) {
          if (locale.countryCode == supportedLocale.countryCode) {
            return supportedLocale;
          }
        } else {
          if (locale.scriptCode == supportedLocale.scriptCode &&
              locale.countryCode == supportedLocale.countryCode) {
            return supportedLocale;
          }
        }
      }
    }
    return null;
  }
}
