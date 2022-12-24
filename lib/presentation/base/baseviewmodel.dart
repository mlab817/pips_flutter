import 'dart:async';

import '../common/state_renderer/state_renderer_implementation.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and functions used by all viewmodels
  final StreamController _inputStateStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start();

  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
