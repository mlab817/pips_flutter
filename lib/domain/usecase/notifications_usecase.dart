import 'package:dartz/dartz.dart';
import 'package:pips_flutter/data/network/failure.dart';
import 'package:pips_flutter/domain/repository/repository.dart';
import 'package:pips_flutter/domain/usecase/base_usecase.dart';

import '../model/model.dart';

class NotificationsUseCase extends BaseUseCase {
  final Repository _repository;

  NotificationsUseCase(this._repository);

  @override
  Future<Either<Failure, List<NotificationItem>>> execute(dynamic input) async {
    return await _repository.getNotifications();
  }
}
