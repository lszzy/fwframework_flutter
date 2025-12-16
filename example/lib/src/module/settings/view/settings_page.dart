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
    final appLocales = [null, AppLocale.en, AppLocale.zhHans, AppLocale.zhHant];
    context.showSheet(
      buttons: appLocales
          .map((al) => al?.name ?? context.s.settings_system)
          .toList(),
      currentIndex: appLocales.map((al) => al?.locale).toList().indexOf(locale),
      action: (index) {
        final appLocale = appLocales[index];
        localeCubit.setLocale(appLocale?.locale);
        MmkvService.instance
            .defaultMMKV()
            .encodeString('appLocale', appLocale?.locale.toLanguageTag());
        EventService.instance.eventBus.fire(LocaleChangedEvent(appLocale));
      },
    );
  }

  void _onThemeTapped(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final theme = themeCubit.state;
    final buttons = [
      S.of(context).settings_system,
      context.s.settings_light,
      context.s.settings_dark,
    ];
    final themes = [ThemeMode.system, ThemeMode.light, ThemeMode.dark];
    context.showSheet(
      buttons: buttons,
      currentIndex: themes.indexOf(theme),
      action: (index) {
        themeCubit.setThemeMode(themes[index]);
      },
    );
  }

  void _onStyleTapped(BuildContext context) {
    final themeStyleCubit = context.read<ThemeStyleCubit>();
    final themeStyle = themeStyleCubit.state;
    final buttons = [
      context.s.settings_default,
      context.s.settings_purple,
      context.s.settings_green,
      context.s.settings_orange,
      context.s.settings_blue,
    ];
    final themeStyles = [
      ThemeStyle.normal,
      ThemeStyle.purple,
      ThemeStyle.green,
      ThemeStyle.orange,
      ThemeStyle.blue,
    ];
    context.showSheet(
      buttons: buttons,
      currentIndex: themeStyles.indexOf(themeStyle),
      action: (index) {
        themeStyleCubit.setThemeStyle(themeStyles[index]);
      },
    );
  }
}
