import 'dart:async';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/usecase/login_usecase.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/freezed_data_classes.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // stream controller for every data point

  final StreamController _usernameStreamController =
      StreamController<String>.broadcast(); // broadcast allows more listener
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  // not private
  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<String>();

  var loginObject = LoginObject("", ""); // data class?

  // for login async call
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    // close the streams
    _usernameStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.username, loginObject.password)))
        .fold(
      (failure) => {
        // failure
        inputState
            .add(ErrorState(StateRendererType.popupErrorState, failure.message))
      },
      (Authentication data) => {
        // success
        print("response data $data"),
        inputState.add(ContentState()),
        // navigate to maincreen after login
        isUserLoggedInSuccessfullyStreamController
            .add(data.accessToken.toString()),
      },
    );
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); // data class operation same as kotlin
    _validate();
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(
        username: username); // data class operation same as kotlin
    _validate();
  }

  @override
  Sink get inputPassword => _passwordStreamController
      .sink; // use sink of controller to return to view

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  Stream<bool> get outputIsUsernameValid => _usernameStreamController.stream
      .map((username) => _isUsernameValid(username));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUsernameValid(loginObject.username);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }
}

abstract class LoginViewModelInputs {
  // three functions
  setUsername(String username);

  setPassword(String password);

  login();

  // two sinks for streams
  Sink get inputUsername;

  Sink get inputPassword;

  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
