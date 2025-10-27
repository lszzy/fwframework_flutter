import 'package:flutter/material.dart';

enum AppLocale {
  en('English', Locale.fromSubtags(languageCode: 'en')),
  zhHans('简体中文', Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans')),
  zhHant('繁體中文', Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'));

  const AppLocale(this.name, this.locale);

  final String name;
  final Locale locale;
}
