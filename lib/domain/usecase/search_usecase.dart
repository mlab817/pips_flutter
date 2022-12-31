import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/data/requests/request.dart';
import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/base_usecase.dart';

class SearchUseCase implements BaseUseCase<SearchUseCaseInput, Projects> {
  final Repository _repository;

  SearchUseCase(this._repository);

  @override
  Future<Either<Failure, Projects>> execute(SearchUseCaseInput input) async {
    return await _repository.searchProjects(
        GetSearchProjectsRequest(input.q, input.page));
  }
}

class SearchUseCaseInput {
  String q;

  int page;

  SearchUseCaseInput(this.q, this.page);
}