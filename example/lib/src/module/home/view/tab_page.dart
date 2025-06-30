import 'package:example/src/module/home/view/home_page.dart';
import 'package:example/src/module/settings/view/settings_page.dart';
import 'package:example/src/module/test/view/test_page.dart';
import 'package:example/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:fwframework_flutter/fwframework_flutter.dart';

enum TabPageType {
  home,
  test,
  settings,
}

class TabPage extends ConsumerWidget {
  const TabPage({super.key});

  static final tabProvider =
      StateProvider<TabPageType>((ref) => TabPageType.home);

  final _pages = const [
    HomePage(),
    TestPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(tabProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: tab.index,
        onTap: (index) {
          ref.read(tabProvider.notifier).state = TabPageType.values[index];
        },
      ),
      body: IndexedStack(
        index: tab.index,
        children: _pages,
      ),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();

  static StatefulShellRoute get route {
    return StatefulShellRoute.indexedStack(
      parentNavigatorKey: AppRouter.navigatorKey,
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) {
              return AppRouter.buildPage(child: const HomePage(), state: state);
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/test',
            pageBuilder: (context, state) {
              return AppRouter.buildPage(child: const TestPage(), state: state);
            },
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) {
              return AppRouter.buildPage(
                  child: const SettingsPage(), state: state);
            },
          ),
        ]),
      ],
      pageBuilder: (context, state, navigationShell) {
        return AppRouter.buildPage(
          child: BottomNavigationPage(child: navigationShell),
          state: state,
        );
      },
    );
  }
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
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
