import 'package:example/gen/l10n.dart';
import 'package:example/src/app/app_router.dart';
import 'package:example/src/module/home/view/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

void main() async {
  Bloc.observer = FwdebugFlutter.blocObserver;
  SmartDialog.config.toast = SmartConfigToast(alignment: Alignment.center);
  AppLauncher.run(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLauncher.build(
        context: context,
        routerTitle: 'fwframework_flutter',
        routerConfig: AppRouter.init(
          routes: [
            ...[TabPage.route],
            ...$appRoutes
          ],
          observers: [FwdebugFlutter.navigatorObserver],
        ),
        routerBuilder: FlutterSmartDialog.init(
          builder: (context, child) {
            FwdebugFlutter.openUrl(AppRouter.router.push);
            return FwdebugFlutter.inspector(child: child!);
          },
        ),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ]);
  }
}
