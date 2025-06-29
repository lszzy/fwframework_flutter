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
        children: const [
          HomePage(),
          TestPage(),
          SettingsPage(),
        ],
      ),
    );
  }
}
