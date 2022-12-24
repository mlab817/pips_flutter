import 'dart:async';

import 'dart:async';

import 'dart:async';

import 'dart:async';

import 'dart:async';

import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {

  final StreamController _nameController = StreamController<String>();
  final StreamController _contactNumberController = StreamController<String>();
  final StreamController _emailController = StreamController<String>();
  final StreamController _usernameController = StreamController<String>();
  final StreamController _passwordController = StreamController<String>();

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _nameController.close();
    _contactNumberController.close();
    _emailController.close();
    _usernameController.close();
    _passwordController.close();
    super.dispose();
  }
}

abstract class RegisterViewModelInputs {
  //
}

abstract class RegisterViewModelOutputs {
  //
}
