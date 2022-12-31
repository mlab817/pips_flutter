import 'dart:async';

import 'package:pips_flutter/data/responses/responses.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/usecase/projects_usecase.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/freezed_data_classes.dart';

class ProjectsViewModel extends BaseViewModel
    with ProjectsViewModelInputs, ProjectsViewModelOutputs {
  final StreamController _projectsStreamController =
      BehaviorSubject<ProjectsObject>();

  final ProjectsUseCase _projectsUseCase;

  ProjectsViewModel(this._projectsUseCase);

  int _currentPage = 1;

  ProjectsObject _projectsObject = ProjectsObject(<Project>[], 0, 1, 1, 10);

  void _getProjects() async {
    // inputState.add(
    //   LoadingState(
    //     stateRendererType: StateRendererType.popupLoadingState,
    //     message: AppStrings.loading,
    //   ),
    // );

    (await _projectsUseCase.execute(ProjectsUseCaseInput(_currentPage))).fold(
        (failure) => {
              print("failure: ${failure.message.toString()}"),
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message)),
            },
        (projectsResponse) => {
              inputState.add(ContentState()),
              _updateDataWithResponse(projectsResponse), // add data to sink
            });
  }

  @override
  void start() {
    _getProjects();
  }

  @override
  void dispose() {
    _projectsStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputProjects => _projectsStreamController.sink;

  @override
  Stream get outputProjects =>
      _projectsStreamController.stream.map((data) => data);

  @override
  void getNextPage() {
    _currentPage++;
    print("currentPage: $_currentPage");
    // refetch next page
    _getProjects();
  }

  _updateDataWithResponse(Projects projectsResponse) {
    // add new data from response
    _projectsObject.data.addAll(projectsResponse.data);

    _projectsObject = _projectsObject.copyWith(
      data: _projectsObject.data,
      total: projectsResponse.total,
      current: projectsResponse.current,
      last: projectsResponse.last,
      pageSize: projectsResponse.pageSize,
    );

    inputProjects.add(_projectsObject);
  }
}

abstract class ProjectsViewModelInputs {
  void getNextPage();

  Sink get inputProjects;
}

abstract class ProjectsViewModelOutputs {
  Stream get outputProjects;
}
