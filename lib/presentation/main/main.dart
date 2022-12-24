import 'package:flutter/material.dart';
import 'package:pips_flutter/presentation/home/home.dart';
import 'package:pips_flutter/presentation/notifications/notifications.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';
import 'package:pips_flutter/presentation/settings/settings.dart';

import '../search/search.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationsPage(),
    const SettingsPage(),
  ];

  final List<String> _titles = [
    'Home',
    'Search',
    'Notifications',
    'Settings',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        elevation: 0.0,
        actions: const [
          Icon(Icons.logout),
          SizedBox(
            width: AppSize.s12,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: _titles[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: _titles[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: _titles[2],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: _titles[3],
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
