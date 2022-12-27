import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/base_usecase.dart';

class DashboardUseCase extends BaseUseCase<void, Dashboard> {
  final Repository _repository;

  DashboardUseCase(this._repository);

  @override
  Future<Either<Failure, Dashboard>> execute(void input) async {
    return await _repository.dashboard();
  }
}
