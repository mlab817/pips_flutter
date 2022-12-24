import 'package:pips_flutter/data/network/error_handler.dart';

class Failure {
  int code; // error code
  String message;

  Failure(this.code, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure()
      : super(ResponseCode.defaultError, ResponseMessage.defaultError);
}
