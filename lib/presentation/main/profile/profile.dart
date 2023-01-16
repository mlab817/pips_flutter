import 'package:flutter/material.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:pips_flutter/data/data_source/shared_prefs_data_source.dart';

import '../../../domain/model/model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final SharedPrefsDataSource _appPreferences =
      instance<SharedPrefsDataSource>();

  User? _user;

  void _initUser() async {
    _user = (await _appPreferences.getUser())!;
  }

  @override
  void initState() {
    super.initState();

    _initUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0.0,
      ),
      body: Center(
        child: _user != null
            ? Text(
                _user.toString(),
              )
            : Container(),
      ),
    );
  }
}
