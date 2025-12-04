import 'package:example/gen/l10n.dart';
import 'package:example/src/library/service/app_event.dart';
import 'package:example/src/library/standard/app_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).tabbar_settings,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: context.appTheme.primaryColor,
      ),
      backgroundColor: context.appTheme.bgColor,
      body: ListView(
        children: [
          ListTile(
            title: Text(S.of(context).settings_locale),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _onLocaleTapped(context),
          ),
          ListTile(
            title: Text(S.of(context).settings_theme),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _onThemeTapped(context),
          ),
          ListTile(
            title: Text(S.of(context).settings_color),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _onStyleTapped(context),
          ),
        ],
      ),
    );
  }

  void _onLocaleTapped(BuildContext context) {
    final localeCubit = context.read<LocaleCubit>();
    final locale = localeCubit.state;
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                localeCubit.setLocale(null);
                MmkvService.instance
                    .defaultMMKV()
                    .encodeString('appLocale', null);
                EventService.instance.eventBus.fire(LocaleChangedEvent(null));
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == null,
              child: Text(S.of(context).settings_system),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                localeCubit.setLocale(AppLocale.en.locale);
                MmkvService.instance.defaultMMKV().encodeString(
                    'appLocale', AppLocale.en.locale.toLanguageTag());
                EventService.instance.eventBus
                    .fire(LocaleChangedEvent(AppLocale.en));
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == AppLocale.en.locale,
              child: Text(AppLocale.en.name),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                localeCubit.setLocale(AppLocale.zhHans.locale);
                MmkvService.instance.defaultMMKV().encodeString(
                    'appLocale', AppLocale.zhHans.locale.toLanguageTag());
                EventService.instance.eventBus
                    .fire(LocaleChangedEvent(AppLocale.zhHans));
                Navigator.of(context).pop();
              },
              isDefaultAction: locale == AppLocale.zhHans.locale,
              child: Text(AppLocale.zhHans.name),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                localeCubit.setLocale(AppLocale.zhHant.locale);
                MmkvService.instance.defaultMMKV().encodeString(
                    'appLocale', AppLocale.zhHant.locale.toLanguageTag());
                EventService.instance.eventBus
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

  void _onThemeTapped(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final theme = themeCubit.state;
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                themeCubit.setThemeMode(ThemeMode.system);
                Navigator.of(context).pop();
              },
              isDefaultAction: theme == ThemeMode.system,
              child: Text(S.of(context).settings_system),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                themeCubit.setThemeMode(ThemeMode.light);
                Navigator.of(context).pop();
              },
              isDefaultAction: theme == ThemeMode.light,
              child: const Text('浅色'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                themeCubit.setThemeMode(ThemeMode.dark);
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

  void _onStyleTapped(BuildContext context) {
    final themeStyleCubit = context.read<ThemeStyleCubit>();
    final themeStyle = themeStyleCubit.state;
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                themeStyleCubit.setThemeStyle(ThemeStyle.normal);
                Navigator.of(context).pop();
              },
              isDefaultAction: themeStyle == ThemeStyle.normal,
              child: const Text('默认'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                themeStyleCubit.setThemeStyle(ThemeStyle.purple);
                Navigator.of(context).pop();
              },
              isDefaultAction: themeStyle == ThemeStyle.purple,
              child: const Text('霞光紫'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                themeStyleCubit.setThemeStyle(ThemeStyle.green);
                Navigator.of(context).pop();
              },
              isDefaultAction: themeStyle == ThemeStyle.green,
              child: const Text('清翠绿'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                themeStyleCubit.setThemeStyle(ThemeStyle.orange);
                Navigator.of(context).pop();
              },
              isDefaultAction: themeStyle == ThemeStyle.orange,
              child: const Text('暖阳橙'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                themeStyleCubit.setThemeStyle(ThemeStyle.blue);
                Navigator.of(context).pop();
              },
              isDefaultAction: themeStyle == ThemeStyle.blue,
              child: const Text('午夜蓝'),
            ),
          ],
        );
      },
    );
  }
}
