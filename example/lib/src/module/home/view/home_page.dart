import 'package:example/gen/l10n.dart';
import 'package:example/src/app/app_router.dart';
import 'package:example/src/module/home/view/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppLifecycleListener _listener;

  @override
  void initState() {
    _listener = AppLifecycleListener(
      onStateChange: (value) {
        FwdebugFlutter.info(
            'AppLifecycleListener.onStateChange: ${value.name}');
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home_title),
      ),
      body: Center(
        child: ClickableWidget(
          onTap: () {
            AppRouter.router.go(TabPageType.test.path);
            AppRouter.router.push(TestScreenutilRoute().location);
          },
          child: Text(
            S.of(context).home_welcome,
            style: TextStyle(color: context.appTheme.primaryColor),
          ),
        ),
      ),
    );
  }
}
