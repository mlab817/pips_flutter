import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pips_flutter/app/routes.dart';
import 'package:pips_flutter/data/data_source/shared_prefs_data_source.dart';
import 'package:pips_flutter/presentation/resources/values_manager.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/app/functions.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SharedPrefsDataSource _appPreferences =
      instance<SharedPrefsDataSource>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pushNamed(context, Routes.profileRoute);
          },
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Security'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pushNamed(context, Routes.securityRoute);
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
        const SizedBox(
          height: AppSize.s20,
        ),
        FutureBuilder<PackageInfo>(
            future: getPackageInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  title: Center(
                      child: Text(
                    snapshot.data != null
                        ? "${snapshot.data?.appName} v${snapshot.data?.version}+${snapshot.data?.buildNumber}"
                        : "Unknown",
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
                );
              } else {
                return ListTile(
                  title: Center(
                    child: Text(
                      'Unknown version',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                );
              }
            }),
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
