import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/data_source/local_data_source.dart';
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
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSource, this._localDataSource,
      this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthenticationResponse response =
        await _remoteDataSource.login(loginRequest);

        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
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

        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      // abort call
      return Left(DataSource.noInternetCorrection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Dashboard>> dashboard() async {
    if (await _networkInfo.isConnected) {
      try {
        final DashboardResponse response = await _remoteDataSource.dashboard();

        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      return Left(DataSource.noInternetCorrection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<NotificationItem>>> getNotifications() async {
    if (await _networkInfo.isConnected) {
      try {
        final NotificationsResponse response =
        await _remoteDataSource.getNotifications();

        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      return Left(DataSource.noInternetCorrection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Projects>> getProjects() async {
    if (await _networkInfo.isConnected) {
      try {
        final ProjectsResponse response = await _remoteDataSource.getProjects();

        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    } else {
      return Left(DataSource.noInternetCorrection.getFailure());
    }
  }

// implement cache fetching before hitting backend
}
