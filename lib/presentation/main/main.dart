import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/data/data_source/shared_prefs_data_source.dart';
import 'package:pips_flutter/presentation/main/home/home.dart';
import 'package:pips_flutter/presentation/main/notifications/notifications.dart';
import 'package:pips_flutter/presentation/main/projects/projects.dart';
import 'package:pips_flutter/presentation/main/search/search.dart';
import 'package:pips_flutter/presentation/main/settings/settings.dart';
import 'package:pips_flutter/presentation/resources/assets_manager.dart';
import 'package:pips_flutter/presentation/resources/color_manager.dart';
import 'package:pips_flutter/app/routes.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';
import 'package:universal_io/prefer_universal/io.dart';

import 'offices/offices.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final SharedPrefsDataSource _appPreferences =
      instance<SharedPrefsDataSource>();

  final List<Widget> _pages = [
    const HomePage(),
    const ProjectsPage(),
    const OfficesView(),
    const SearchPage(),
    const NotificationsPage(),
    const SettingsPage(),
  ];

  final List<String> _titles = [
    AppStrings.homeTitle,
    AppStrings.projectsTitle,
    AppStrings.officesTitle,
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
      body: Row(
        children: [
          NavigationRail(
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.view_module),
                selectedIcon: Icon(Icons.view_module),
                label: Text('Projects'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.local_convenience_store_rounded),
                selectedIcon: Icon(Icons.local_convenience_store_rounded),
                label: Text(AppStrings.officesTitle),
              ),
              // NavigationRailDestination(
              //   icon: Icon(Icons.monitor),
              //   selectedIcon: Icon(Icons.monitor),
              //   label: Text('Tracker'),
              // ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                selectedIcon: Icon(Icons.search),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.notifications),
                selectedIcon: Icon(Icons.notifications),
                label: Text('Notifications'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.exit_to_app),
                selectedIcon: Icon(Icons.exit_to_app),
                label: Text('Logout'),
              ),
            ],
            selectedIndex: _currentIndex,
            onDestinationSelected: _onTap,
          ),
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
      drawer: kIsWeb
          ? Drawer(
              child: ListView(children: <Widget>[
                DrawerHeader(
                  // decoration: const BoxDecoration(
                  //   color: Colors.white,
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset(ImageAssets.splashLogo),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(AppStrings.homeTitle),
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.view_module),
                  title: const Text(AppStrings.projectsTitle),
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.local_convenience_store_rounded),
                  title: const Text(AppStrings.officesTitle),
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.monitor),
                  title: const Text(AppStrings.trackerTitle),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(AppStrings.comingSoon)));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text(AppStrings.notificationsTitle),
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text(AppStrings.settingsTitle),
                  onTap: () {
                    setState(() {
                      _currentIndex = 4;
                    });
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text(AppStrings.logoutLabelText),
                ),
              ]),
            )
          : null,
      bottomNavigationBar: !kIsWeb && !Platform.isMacOS
          ? Container(
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
            )
          : null,
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
