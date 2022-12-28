import 'package:flutter/material.dart';

import 'package:pips_flutter/app/app_prefs.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/presentation/main/home/home.dart';
import 'package:pips_flutter/presentation/main/notifications/notifications.dart';
import 'package:pips_flutter/presentation/main/projects/projects.dart';
import 'package:pips_flutter/presentation/main/search/search.dart';
import 'package:pips_flutter/presentation/main/settings/settings.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/presentation/resources/routes_manager.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final List<Widget> _pages = [
    const HomePage(),
    const ProjectsPage(),
    const SearchPage(),
    const NotificationsPage(),
    const SettingsPage(),
  ];

  final List<String> _titles = [
    AppStrings.homeTitle,
    AppStrings.projectsTitle,
    AppStrings.searchTitle,
    AppStrings.notificationsTitle,
    AppStrings.settingsTitle,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(
            width: AppSize.s1_5,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightGrey,
              spreadRadius: AppSize.s1,
            ),
          ],
        ),
        child: BottomNavigationBar(
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
              icon: const Icon(Icons.view_module),
              label: _titles[1],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: _titles[2],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              label: _titles[3],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: _titles[4],
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onTap,
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _logout() {
    _appPreferences.logout();

    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  Widget? _buildFloatingActionButton() {
    // if currently at home page, show FAB
    if (_currentIndex == 0) {
      return FloatingActionButton(
        onPressed: null,
        backgroundColor: ColorManager.primary,
        child: const Icon(Icons.add),
      );
    } else {
      return null;
    }
  }
}
