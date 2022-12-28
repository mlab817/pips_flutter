import 'dart:async';
import 'dart:ffi';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/usecase/notifications_usecase.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:rxdart/rxdart.dart';

class NotificationsViewModel extends BaseViewModel
    with NotificationsViewModelInputs, NotificationsViewModelOutputs {
  final _streamController = BehaviorSubject<NotificationObject>();

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
        (data) => {
              inputState.add(ContentState()),
              inputNotifications.add(NotificationObject(data))
            });
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
  Sink get inputNotifications => _streamController.sink;

  @override
  Stream<NotificationObject> get outputNotificationsObject =>
      _streamController.stream.map((data) => data);
}

abstract class NotificationsViewModelInputs {
  Sink get inputNotifications;
}

abstract class NotificationsViewModelOutputs {
  Stream<NotificationObject> get outputNotificationsObject;
}

class NotificationObject {
  List<NotificationItem> notifications;

  int getLength() {
    return notifications.length;
  }

  NotificationObject(this.notifications);
}
