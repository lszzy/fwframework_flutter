import 'package:example/gen/l10n.dart';
import 'package:example/src/app/app_router.dart';
import 'package:example/src/service/manager/preference_manager.dart';
import 'package:example/src/service/provider/locale_provider.dart';
import 'package:example/src/service/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.ensureInitialized();

  runApp(ProviderScope(
    observers: [FwdebugFlutter.riverpodObserver],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'fwframework_flutter',
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          // appBarTheme.toolbarHeight自定义全局导航栏高度
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: themeMode,
          builder: FlutterSmartDialog.init(
            builder: (context, child) {
              FwdebugFlutter.openUrl(appRouter.push);
              return FwdebugFlutter.inspector(child: child!);
            },
          ),
          locale: locale,
          supportedLocales: S.delegate.supportedLocales,
          localeListResolutionCallback: (locales, supportedLocales) {
            final locale = locales?.firstOrNull;
            return LocaleNotifier.supportedLocale(locale, supportedLocales) ??
                LocaleNotifier.en;
          },
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
