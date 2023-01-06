import 'dart:async';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/usecase/dashboard_usecase.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInputs, HomeViewModelOutputs {
  final DashboardUseCase _dashboardUseCase;

  final StreamController _dashboardStreamController =
      BehaviorSubject<Dashboard>();

  HomeViewModel(this._dashboardUseCase);

  void _getDashboard() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _dashboardUseCase.execute(null)).fold(
        (failure) => {
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message)),
            },
        (dashboard) => {
              inputState.add(ContentState()),
              inputDashboard.add(Dashboard(dashboard.pipsStatuses,
                  dashboard.total, dashboard.validated, dashboard.endorsed)),
            });
  }

  @override
  void start() {
    _getDashboard();
  }

  @override
  void dispose() {
    _dashboardStreamController.close();
    super.dispose();
  }

  @override
  Stream<Dashboard> get outputDashboard =>
      _dashboardStreamController.stream.map((data) => data);

  @override
  Sink get inputDashboard => _dashboardStreamController.sink;
}

abstract class HomeViewModelInputs {
  Sink get inputDashboard;
}

abstract class HomeViewModelOutputs {
  Stream<Dashboard> get outputDashboard;
}
