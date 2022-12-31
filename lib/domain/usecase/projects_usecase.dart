import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/data/requests/request.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/base_usecase.dart';
import 'package:pips_flutter/domain/usecase/login_usecase.dart';

import '../model/model.dart';

class ProjectsUseCase implements BaseUseCase<ProjectsUseCaseInput, Projects> {
  final Repository _repository;

  ProjectsUseCase(this._repository);

  @override
  Future<Either<Failure, Projects>> execute(ProjectsUseCaseInput input) async {
    return await _repository.getProjects(GetProjectsRequest(input.page));
  }
}

class ProjectsUseCaseInput {
  int page;

  ProjectsUseCaseInput(this.page);
}
