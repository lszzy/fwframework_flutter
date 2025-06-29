import 'package:example/gen/l10n.dart';
import 'package:example/src/service/manager/preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(locale);

  static Locale? get locale {
    final languageTag = PreferenceManager.instance.getString('AppLocale');
    return fromLanguageTag(languageTag);
  }

  void setLocale(Locale? locale) {
    if (state != locale) {
      state = locale;
      PreferenceManager.instance
          .setString('AppLocale', locale?.toLanguageTag() ?? '');
    }
  }

  static const en = Locale.fromSubtags(languageCode: 'en');
  static const zhHans =
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
  static const zhHant =
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');

  static Locale? fromLanguageTag(String? languageTag) {
    if (languageTag == null || languageTag.isEmpty) return null;
    final parts = languageTag.split('-');
    if (parts.isEmpty || parts[0].isEmpty) return null;
    return Locale.fromSubtags(
      languageCode: parts[0],
      scriptCode: parts.length > 1 && parts[1].isNotEmpty ? parts[1] : null,
      countryCode: parts.length > 2 && parts[2].isNotEmpty ? parts[2] : null,
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

extension BuildContextLocaleExtension on BuildContext {
  S get locale {
    return S.of(this);
  }
}
