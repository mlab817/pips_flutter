import 'dart:async';

import 'package:pips_flutter/app/functions.dart';
import 'package:pips_flutter/domain/usecase/forgot_password_usecase.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  // create the streams
  final StreamController _emailStreamController = StreamController<String>();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  String email = '';

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputsValidStreamController.close();
    super.dispose();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  @override
  sendResetPasswordEmail() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _forgotPasswordUseCase.execute(ForgotPasswordUseCaseInput(
      email,
    )))
        .fold(
            (failure) => {
                  // failure
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                },
            (supportMessage) => {
                  inputState.add(SuccessState(supportMessage.status.toString()))
                });
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  Stream<bool> get outputIsEmailInputValid =>
      _emailStreamController.stream.map((_) => isEmailValid(email));

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputsValidStreamController.stream
          .map((isAllInputValid) => _isAllInputValid());

  bool _isAllInputValid() {
    return isEmailValid(email);
  }

  void _validate() {
    inputIsAllInputValid.add(null);
  }
}

// sink
abstract class ForgotPasswordViewModelInputs {
  sendResetPasswordEmail();

  setEmail(String email);

  Sink get inputEmail;

  Sink get inputIsAllInputValid;
}

// stream
abstract class ForgotPasswordViewModelOutputs {
  Stream<bool> get outputIsEmailInputValid;

  Stream<bool> get outputIsAllInputValid;
}
