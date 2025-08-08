import 'package:example/gen/l10n.dart';
import 'package:example/src/library/standard/app_locale.dart';
import 'package:example/src/app/app_router.dart';
import 'package:example/src/module/home/view/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.ensureInitialized();
  await MmkvService.ensureInitialized();

  Bloc.observer = FwdebugFlutter.blocObserver;
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state;
    final themeMode = context.watch<ThemeCubit>().state;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'fwframework_flutter',
          routerConfig: AppRouter.init(
            routes: [
              ...[TabPage.route],
              ...$appRoutes
            ],
            observers: [FwdebugFlutter.navigatorObserver],
          ),
          debugShowCheckedModeBanner: false,
          // appBarTheme.toolbarHeight自定义全局导航栏高度
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: themeMode,
          builder: FlutterSmartDialog.init(
            builder: (context, child) {
              FwdebugFlutter.openUrl(AppRouter.router.push);
              return FwdebugFlutter.inspector(child: child!);
            },
          ),
          locale: locale,
          supportedLocales: S.delegate.supportedLocales,
          localeListResolutionCallback: (locales, supportedLocales) {
            final locale = locales?.firstOrNull;
            return LocaleService.supportedLocale(locale, supportedLocales) ??
                AppLocale.en.locale;
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
