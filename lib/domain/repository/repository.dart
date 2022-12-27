import 'package:dartz/dartz.dart';

import 'package:pips_flutter/domain/model/model.dart';
import 'package:pips_flutter/data/requests/request.dart';
import 'package:pips_flutter/data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, ForgotPassword>> sendPasswordResetEmail(
      ForgotPasswordRequest forgotPasswordRequest);

  Future<Either<Failure, Dashboard>> dashboard();

  Future<Either<Failure, List<NotificationItem>>> getNotifications();
}
