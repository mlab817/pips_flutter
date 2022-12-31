import 'package:flutter/material.dart';
import 'package:pips_flutter/app/app_prefs.dart';
import 'package:pips_flutter/app/dependency_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/model/model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // final AppPreferences _appPreferences = instance<AppPreferences>();

  late SharedPreferences _prefs;

  // var _currentUser;
  //
  // Future<void> _getUser() async {
  //   final user = await _appPreferences.getUser();
  //   print(user);
  //
  //   _currentUser = user;
  // }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();

    _initPrefs();

    // initialize user
    // _getUser();
  }

  @override
  Widget build(BuildContext context) {
    final keys = _prefs.getKeys();

    print(keys);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0.0,
      ),
      body: Center(
        child: _prefs == null
            ? Text(_prefs.getKeys().toString())
            : const Center(child: Text('Initializing shared prefs')),
      ),
    );
  }
}
