import 'package:example/src/library/standard/app_locale.dart';

class LocaleChangedEvent {
  LocaleChangedEvent(this.locale);

  final AppLocale? locale;
}
