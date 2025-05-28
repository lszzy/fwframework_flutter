import 'package:example/src/module/home/view/home_page.dart';
import 'package:example/src/module/settings/view/settings_page.dart';
import 'package:example/src/module/test/view/test_page.dart';
import 'package:flutter/material.dart';

enum TabPageType {
  car,
  transit,
  bike,
}

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  TabPageType _selectedTab = TabPageType.car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_transit),
            label: 'Transit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: 'Bike',
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
