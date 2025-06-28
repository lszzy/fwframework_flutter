import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null);

  void setLocale(Locale? locale) {
    if (state != locale) {
      state = locale;
    }
  }

  static const en = Locale.fromSubtags(languageCode: 'en');
  static const zhHans =
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
  static const zhHant =
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');

  static Locale? localeListResolutionCallback(
    List<Locale>? locales,
    Iterable<Locale> supportedLocales,
  ) {
    final locale = locales?.firstOrNull;
    if (locale != null && locale.languageCode == 'zh') {
      if (locale.scriptCode == 'Hant' ||
          locale.countryCode == 'HK' ||
          locale.countryCode == 'TW') {
        return zhHant;
      }
      return zhHans;
    }
    return en;
  }
}
