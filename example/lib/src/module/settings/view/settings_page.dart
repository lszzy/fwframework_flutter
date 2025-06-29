import 'package:example/gen/l10n.dart';
import 'package:example/src/service/provider/locale_provider.dart';
import 'package:example/src/service/provider/theme_provider.dart';
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
    final locale = ref.watch(localeProvider);
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                ref.read(localeProvider.notifier).setLocale(null);
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == null,
              child: Text(S.of(context).settings_system),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref.read(localeProvider.notifier).setLocale(LocaleNotifier.en);
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == LocaleNotifier.en,
              child: const Text('English'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref
                    .read(localeProvider.notifier)
                    .setLocale(LocaleNotifier.zhHans);
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == LocaleNotifier.zhHans,
              child: const Text('简体中文'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref
                    .read(localeProvider.notifier)
                    .setLocale(LocaleNotifier.zhHant);
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == LocaleNotifier.zhHant,
              child: const Text('繁體中文'),
            ),
          ],
        );
      },
    );
  }

  void _onThemeTapped(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                ref.read(themeProvider.notifier).setThemeMode(ThemeMode.system);
                Navigator.of(context).pop();
              },
              isDefaultAction: theme == ThemeMode.system,
              child: Text(S.of(context).settings_system),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref.read(themeProvider.notifier).setThemeMode(ThemeMode.light);
                Navigator.of(context).pop();
              },
              isDefaultAction: theme == ThemeMode.light,
              child: const Text('浅色'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                ref.read(themeProvider.notifier).setThemeMode(ThemeMode.dark);
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
