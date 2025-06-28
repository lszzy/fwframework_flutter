import 'package:example/gen/l10n.dart';
import 'package:example/src/module/home/view/tab_page.dart';
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
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'fwframework_flutter',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeMode,
      home: const TabPage(),
      builder: (context, child) {
        return FwdebugFlutter.inspector(child: child!);
      },
      navigatorObservers: [FwdebugFlutter.navigatorObserver],
      locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      localeListResolutionCallback: LocaleNotifier.localeListResolutionCallback,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
