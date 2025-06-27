import 'package:example/gen/l10n.dart';
import 'package:example/src/module/home/view/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TabPage(),
      builder: (context, child) {
        return FwdebugFlutter.inspector(child: child!);
      },
      navigatorObservers: [FwdebugFlutter.navigatorObserver],
      supportedLocales: S.delegate.supportedLocales,
      localeListResolutionCallback: (locales, supportedLocales) {
        final locale = locales?.firstOrNull;
        if (locale != null && locale.languageCode == 'zh') {
          if (locale.scriptCode == 'Hant' ||
              locale.countryCode == 'HK' ||
              locale.countryCode == 'TW') {
            return const Locale.fromSubtags(
                languageCode: 'zh', scriptCode: 'Hant');
          }
          return const Locale.fromSubtags(
              languageCode: 'zh', scriptCode: 'Hans');
        }
        return const Locale.fromSubtags(languageCode: 'en');
      },
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
