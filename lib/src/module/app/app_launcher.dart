import 'package:flutter/material.dart';
import 'package:fwframework_flutter/src/service/storage_service.dart';
import 'package:fwframework_flutter/src/service/mmkv_service.dart';
import 'package:fwframework_flutter/src/service/locale_service.dart';
import 'package:fwframework_flutter/src/service/theme_service.dart';
import 'package:fwframework_flutter/src/module/app/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLauncher {
  static void run(Widget app) async {
    WidgetsFlutterBinding.ensureInitialized();
    await StorageService.ensureInitialized();
    await MmkvService.ensureInitialized();

    runApp(MultiBlocProvider(providers: [
      BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
      BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      BlocProvider<ThemeStyleCubit>(create: (_) => ThemeStyleCubit()),
    ], child: app));
  }

  static Widget build({
    required BuildContext context,
    required RouterConfig<Object>? routerConfig,
    required Iterable<Locale> supportedLocales,
    required Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    String routerTitle = '',
    TransitionBuilder? routerBuilder,
    Size? designSize,
    bool splitScreenMode = false,
    bool minTextAdapt = false,
    ThemeData? theme,
    ThemeData? darkTheme,
  }) {
    final locale = context.watch<LocaleCubit>().state;
    final themeMode = context.watch<ThemeCubit>().state;
    final themeStyle = context.watch<ThemeStyleCubit>().state;
    return ScreenUtilInit(
      designSize: designSize ?? const Size(375, 812),
      minTextAdapt: minTextAdapt,
      splitScreenMode: splitScreenMode,
      builder: (context, child) {
        return MaterialApp.router(
          title: routerTitle,
          routerConfig: routerConfig,
          debugShowCheckedModeBanner: false,
          theme: theme ??
              ThemeData.light(useMaterial3: true).copyWith(
                splashFactory: NoSplash.splashFactory,
                extensions: [AppPalette.lightTheme(themeStyle)],
              ),
          darkTheme: darkTheme ??
              ThemeData.dark(useMaterial3: true).copyWith(
                splashFactory: NoSplash.splashFactory,
                extensions: [AppPalette.darkTheme(themeStyle)],
              ),
          themeMode: themeMode,
          builder: routerBuilder,
          locale: locale,
          supportedLocales: supportedLocales,
          localeListResolutionCallback: (locales, supportedLocales) {
            final locale = locales?.firstOrNull;
            return LocaleService.supportedLocale(locale, supportedLocales) ??
                supportedLocales.firstOrNull;
          },
          localizationsDelegates: localizationsDelegates,
        );
      },
    );
  }
}
