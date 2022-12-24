import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/data/requests/request.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/base_usecase.dart';

import '../model/model.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPasswordUseCaseInput, ForgotPassword> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgotPassword>> execute(
      ForgotPasswordUseCaseInput input) async {
    return await _repository
        .sendPasswordResetEmail(ForgotPasswordRequest(input.email));
  }
}

class ForgotPasswordUseCaseInput {
  String email;

  ForgotPasswordUseCaseInput(this.email);
}
