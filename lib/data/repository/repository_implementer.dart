import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/error_handler.dart';

import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/data/requests/request.dart';
import 'package:pips_flutter/data/mapper/mapper.dart';
import 'package:pips_flutter/data/data_source/remote_data_source.dart';
import 'package:pips_flutter/data/network/network_info.dart';
import 'package:pips_flutter/data/responses/responses.dart';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/domain/repository/repository.dart';

class RepositoryImplementer extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthenticationResponse response =
            await _remoteDataSource.login(loginRequest);

        return Right(response.toDomain());

        // if (response.status == ApiInternalStatus.success) {
        //   // handle success
        //   return Right(response.toDomain());
        // } else {
        //   // error
        //   return Left(Failure(response.status ?? ApiInternalStatus.failed,
        //       response.message ?? ResponseMessage.defaultError));
        // }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // abort call
      return Left(DataSource.noInternetCorrection.getFailure());
    }
  }

  @override
  Future<Either<Failure, ForgotPassword>> sendPasswordResetEmail(
      ForgotPasswordRequest forgotPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final ForgotPasswordResponse response = await _remoteDataSource
            .sendResetPasswordEmail(forgotPasswordRequest);

        // if (response.status == ApiInternalStatus.success) {
        //   // handle success
        //   return Right(response.toDomain());
        // } else {
        //   // error
        //   return Left(Failure(response.status ?? ApiInternalStatus.failed,
        //       response.message ?? ResponseMessage.defaultError));
        // }
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // abort call
      return Left(DataSource.noInternetCorrection.getFailure());
    }
  }
}
