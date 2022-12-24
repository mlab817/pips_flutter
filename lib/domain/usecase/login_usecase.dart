import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/data/requests/request.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/base_usecase.dart';

// loginusecaseinput - viewmodel inputs
class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository
        .login(LoginRequest(input.username, input.password));
  }
}

class LoginUseCaseInput {
  String username;
  String password;

  LoginUseCaseInput(this.username, this.password);
}
