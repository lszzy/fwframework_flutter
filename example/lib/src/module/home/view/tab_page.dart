import 'package:example/src/module/home/view/home_page.dart';
import 'package:example/src/module/settings/view/settings_page.dart';
import 'package:example/src/module/test/view/test_page.dart';
import 'package:example/gen/l10n.dart';
import 'package:flutter/material.dart';

enum TabPageType {
  home,
  test,
  settings,
}

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  TabPageType _selectedTab = TabPageType.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: S.current.tabbar_home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bug_report),
            label: S.current.tabbar_test,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: S.current.tabbar_settings,
          ),
        ],
        currentIndex: _selectedTab.index,
        onTap: (index) {
          setState(() {
            _selectedTab = TabPageType.values[index];
          });
        },
      ),
      body: IndexedStack(
        index: _selectedTab.index,
        children: const [
          HomePage(),
          TestPage(),
          SettingsPage(),
        ],
      ),
    );
  }
}
