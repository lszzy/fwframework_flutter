import 'package:example/gen/l10n.dart';
import 'package:example/src/library/service/app_event.dart';
import 'package:example/src/library/standard/app_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tabbar_settings),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(S.of(context).settings_locale),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _onLocaleTapped(context, ref),
          ),
          ListTile(
            title: Text(S.of(context).settings_theme),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _onThemeTapped(context, ref),
          ),
        ],
      ),
    );
  }

  void _onLocaleTapped(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(LocaleService.localeProvider);
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                ref.read(LocaleService.localeProvider.notifier).setLocale(null);
                MmkvService.instance
                    .defaultMMKV()
                    .encodeString('appLocale', null);
                EventService.eventBus.fire(LocaleChangedEvent(null));
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == null,
              child: Text(S.of(context).settings_system),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref
                    .read(LocaleService.localeProvider.notifier)
                    .setLocale(AppLocale.en.locale);
                MmkvService.instance.defaultMMKV().encodeString(
                    'appLocale', AppLocale.en.locale.toLanguageTag());
                EventService.eventBus.fire(LocaleChangedEvent(AppLocale.en));
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == AppLocale.en.locale,
              child: Text(AppLocale.en.name),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref
                    .read(LocaleService.localeProvider.notifier)
                    .setLocale(AppLocale.zhHans.locale);
                MmkvService.instance.defaultMMKV().encodeString(
                    'appLocale', AppLocale.zhHans.locale.toLanguageTag());
                EventService.eventBus
                    .fire(LocaleChangedEvent(AppLocale.zhHans));
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == AppLocale.zhHans.locale,
              child: Text(AppLocale.zhHans.name),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref
                    .read(LocaleService.localeProvider.notifier)
                    .setLocale(AppLocale.zhHant.locale);
                MmkvService.instance.defaultMMKV().encodeString(
                    'appLocale', AppLocale.zhHant.locale.toLanguageTag());
                EventService.eventBus
                    .fire(LocaleChangedEvent(AppLocale.zhHant));
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == AppLocale.zhHant.locale,
              child: Text(AppLocale.zhHant.name),
            ),
          ],
        );
      },
    );
  }

  void _onThemeTapped(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(ThemeService.themeProvider);
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                ref
                    .read(ThemeService.themeProvider.notifier)
                    .setThemeMode(ThemeMode.system);
                Navigator.of(context).pop();
              },
              isDefaultAction: theme == ThemeMode.system,
              child: Text(S.of(context).settings_system),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref
                    .read(ThemeService.themeProvider.notifier)
                    .setThemeMode(ThemeMode.light);
                Navigator.of(context).pop();
              },
              isDefaultAction: theme == ThemeMode.light,
              child: const Text('浅色'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref
                    .read(ThemeService.themeProvider.notifier)
                    .setThemeMode(ThemeMode.dark);
                Navigator.of(context).pop();
              },
              isDefaultAction: theme == ThemeMode.dark,
              child: const Text('深色'),
            ),
          ],
        );
      },
    );
  }
}
