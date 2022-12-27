import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/usecase/notifications_usecase.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';

class NotificationsViewModel extends BaseViewModel
    with NotificationsViewModelInputs, NotificationsViewModelOutputs {
  final StreamController _streamController =
      StreamController<List<NotificationItem>>.broadcast();

  final NotificationsUseCase _notificationsUseCase;

  NotificationsViewModel(this._notificationsUseCase);

  void _getNotifications() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _notificationsUseCase.execute(Void)).fold(
        (failure) => {
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message)),
            },
        (data) => {inputState.add(ContentState()), inputState.add(data)});
  }

  @override
  void start() {
    _getNotifications();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Stream<List<Notification>> get outputNotifications =>
      _streamController.stream.map((data) => data);

  @override
  Sink get inputNotifications => _streamController.sink;
}

abstract class NotificationsViewModelInputs {
  Sink get inputNotifications;
}

abstract class NotificationsViewModelOutputs {
  Stream<List<NotificationItem>> get outputNotifications;
}
