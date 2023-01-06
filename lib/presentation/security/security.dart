import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pips_flutter/presentation/resources/strings_manager.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.securityTitle),
        elevation: 0.0,
      ),
      body: _getBodyWidget(),
    );
  }

  _getBodyWidget() {
    return ListView(
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.key),
          title: Text('Change Password'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Login History'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.fingerprint),
          title: Text('Touch ID'),
          trailing: Switch(value: true, onChanged: null),
        ),
      ],
    );
  }
}
