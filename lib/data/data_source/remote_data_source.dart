import 'package:pips_flutter/data/network/app_api.dart';
import 'package:pips_flutter/data/requests/request.dart';
import 'package:pips_flutter/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<ForgotPasswordResponse> sendResetPasswordEmail(
      ForgotPasswordRequest forgotPasswordRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.username,
      loginRequest.password,
    );
  }

  @override
  Future<ForgotPasswordResponse> sendResetPasswordEmail(
      ForgotPasswordRequest forgotPasswordRequest) async {
    return await _appServiceClient.sendPasswordResetEmail(
      forgotPasswordRequest.email,
    );
  }
}
