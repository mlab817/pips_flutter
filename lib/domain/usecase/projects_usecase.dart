import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/base_usecase.dart';

import '../model/model.dart';

class ProjectsUseCase extends BaseUseCase {
  final Repository _repository;

  ProjectsUseCase(this._repository);

  @override
  Future<Either<Failure, Projects>> execute(void input) async {
    return await _repository.getProjects();
  }
}
