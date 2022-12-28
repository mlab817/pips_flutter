import 'dart:async';
import 'dart:ffi';

import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/projects_usecase.dart';
import 'package:pips_flutter/presentation/base/baseviewmodel.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:pips_flutter/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/model/model.dart';
import '../../resources/strings_manager.dart';

class ProjectsViewModel extends BaseViewModel
    with ProjectsViewModelInputs, ProjectsViewModelOutputs {
  final StreamController _projectsStreamController =
      BehaviorSubject<ProjectsObject>();

  final ProjectsUseCase _projectsUseCase;

  ProjectsViewModel(this._projectsUseCase);

  void _getProjects() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
        message: AppStrings.loading));

    (await _projectsUseCase.execute(Void)).fold(
        (failure) => {
              print("failure: ${failure.message.toString()}"),
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message)),
            },
        (data) => {
              inputState.add(ContentState()),
              inputProjects.add(ProjectsObject(data)), // add data to sink
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
}

abstract class ProjectsViewModelInputs {
  Sink get inputProjects;
}

abstract class ProjectsViewModelOutputs {
  Stream get outputProjects;
}

class ProjectsObject {
  Projects projects;

  ProjectsObject(this.projects);
}
