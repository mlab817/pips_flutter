import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/base_usecase.dart';

class OfficesUseCase extends BaseUseCase<OfficesUseCaseInput, Offices> {
  final Repository _repository;

  OfficesUseCase(this._repository);

  @override
  Future<Either<Failure, Offices>> execute(OfficesUseCaseInput input) async {
    return await _repository.getOffices(input.page);
  }
}

class OfficesUseCaseInput {
  int page;

  OfficesUseCaseInput(this.page);
}
