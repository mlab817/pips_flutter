import 'package:dio/dio.dart';

import 'failure.dart';

// define the list of possible errors related to network
enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  methodNotAllowed,
  requestTimeout,
  tooManyRequest,
  internalServerError,
  serviceUnavailable,
  unknownError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetCorrection,
  defaultError
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // error from API response
      failure = _handleError(error);
    } else {
      // default error
      print("Internal Error: ${error.toString()}");
      failure = DataSource.defaultError.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.response: // incorrect status
        switch (error.response!.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unauthorized:
            return DataSource.unauthorized.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            return DataSource.defaultError.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.other:
        return DataSource.connectTimeout.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.methodNotAllowed:
        return Failure(
            ResponseCode.methodNotAllowed, ResponseMessage.methodNotAllowed);
      case DataSource.requestTimeout:
        return Failure(
            ResponseCode.requestTimeout, ResponseMessage.requestTimeout);
      case DataSource.tooManyRequest:
        return Failure(
            ResponseCode.tooManyRequest, ResponseMessage.tooManyRequest);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.serviceUnavailable:
        return Failure(ResponseCode.serviceUnavailable,
            ResponseMessage.serviceUnavailable);
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetCorrection:
        return Failure(ResponseCode.noInternetCorrection,
            ResponseMessage.noInternetCorrection);
      default:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}

class ResponseCode {
  // API
  static const int success = 200;
  static const int noContent = 200;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unauthorized = 401;
  static const int notFound = 404;
  static const int methodNotAllowed = 404;
  static const int requestTimeout = 408;
  static const int tooManyRequest = 429;
  static const int internalServerError = 500;
  static const int serviceUnavailable = 503;

  // local status code
  static const int defaultError = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetCorrection = -7;
}

class ResponseMessage {
  // API
  static const String success = "success";
  static const String noContent = "success with no content";
  static const String badRequest = "bad request, try again later";
  static const String forbidden = "forbidden request, try again later";
  static const String unauthorized = "user is unauthorized";
  static const String notFound = "not found";
  static const String methodNotAllowed = "method not allowed";
  static const String requestTimeout = "request timeout, try again later";
  static const String tooManyRequest = "too many request";
  static const String internalServerError = "internal server error";
  static const String serviceUnavailable = "service unavailable";

  // local status code
  static const String defaultError = "unknown error, try again later";
  static const String connectTimeout = "connection timeout, try again later";
  static const String cancel = "request was cancelled";
  static const String receiveTimeout = "time out error, try again later";
  static const String sendTimeout = "time out error, try again later";
  static const String cacheError = "cache error, try again later";
  static const String noInternetCorrection =
      "please check your internet connection and try again";
}

// when api response has status code {status: 0}
class ApiInternalStatus {
  static const int success = 0;
  static const int failed = 1;
}
