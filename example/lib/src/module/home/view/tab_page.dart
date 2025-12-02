import 'dart:async';

import 'package:example/src/library/service/app_event.dart';
import 'package:example/src/module/home/view/home_page.dart';
import 'package:example/src/module/settings/view/settings_page.dart';
import 'package:example/src/module/test/view/test_page.dart';
import 'package:example/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

enum TabPageType {
  home('/'),
  test('/test'),
  settings('/settings');

  const TabPageType(this.path);
  final String path;

  Widget page(BuildContext context, GoRouterState state) {
    switch (this) {
      case TabPageType.home:
        return const HomePage();
      case TabPageType.test:
        return const TestPage();
      case TabPageType.settings:
        return const SettingsPage();
    }
  }
}

class TabPage extends StatefulWidget {
  const TabPage({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  State<TabPage> createState() => _TabPageState();

  static StatefulShellRoute get route {
    return AppRouter.shellRoute(
      routes: [
        GoRoute(
          path: TabPageType.home.path,
          pageBuilder: (context, state) {
            return AppRouter.buildPage(
              child: TabPageType.home.page(context, state),
              state: state,
            );
          },
        ),
        GoRoute(
          path: TabPageType.test.path,
          pageBuilder: (context, state) {
            return AppRouter.buildPage(
              child: TabPageType.test.page(context, state),
              state: state,
            );
          },
        ),
        GoRoute(
          path: TabPageType.settings.path,
          pageBuilder: (context, state) {
            return AppRouter.buildPage(
              child: TabPageType.settings.page(context, state),
              state: state,
            );
          },
        ),
      ],
      pageBuilder: (context, state, navigationShell) {
        return AppRouter.buildPage(
          child: TabPage(child: navigationShell),
          state: state,
        );
      },
    );
  }
}

class _TabPageState extends State<TabPage> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    _subscription =
        EventService.instance.eventBus.on<LocaleChangedEvent>().listen((event) {
      FwdebugFlutter.info('LocaleChangedEvent: ${event.locale?.name}');
      final appLocale =
          MmkvService.instance.defaultMMKV().decodeString('appLocale');
      FwdebugFlutter.info('appLocale: ${appLocale.toString()}');
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
        selectedItemColor: context.appTheme.primaryColor,
        unselectedItemColor: context.appTheme.contentColor,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: S.of(context).tabbar_home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bug_report),
            label: S.of(context).tabbar_test,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: S.of(context).tabbar_settings,
          ),
        ],
      ),
    );
  }
}
