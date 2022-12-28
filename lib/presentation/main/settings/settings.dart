import 'package:flutter/material.dart';
import 'package:pips_flutter/app/app_prefs.dart';
import 'package:pips_flutter/presentation/resources/routes_manager.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';

import '../../../app/dependency_injection.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppPadding.p8),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Security'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {

          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('About'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pushNamed(context, Routes.aboutRoute);
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          // trailing: const Icon(Icons.chevron_right),
          onTap: _logout,
        ),
      ],
    );
  }

  void _logout() {
    //
    _appPreferences.logout();
    // clear localDataSource
    // navigate to login
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
