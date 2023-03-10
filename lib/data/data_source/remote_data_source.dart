import 'package:pips_flutter/data/network/app_api.dart';
import 'package:pips_flutter/data/requests/request.dart';
import 'package:pips_flutter/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<ForgotPasswordResponse> sendResetPasswordEmail(
      ForgotPasswordRequest forgotPasswordRequest);

  Future<DashboardResponse> dashboard();

  Future<NotificationsResponse> getNotifications();

  Future<ProjectsResponse> getProjects(GetProjectsRequest getProjectsRequest);

  Future<ProjectsResponse> searchProjects(
      GetSearchProjectsRequest getSearchProjectsRequest);

  Future<OfficesResponse> getOffices(int page);
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

  @override
  Future<DashboardResponse> dashboard() async {
    return await _appServiceClient.dashboard();
  }

  @override
  Future<NotificationsResponse> getNotifications() async {
    return await _appServiceClient.getNotifications();
  }

  @override
  Future<ProjectsResponse> getProjects(
      GetProjectsRequest getProjectsRequest) async {
    return await _appServiceClient.getProjects(getProjectsRequest.page);
  }

  @override
  Future<ProjectsResponse> searchProjects(
      GetSearchProjectsRequest getSearchProjectsRequest) async {
    return await _appServiceClient.searchProjects(
        getSearchProjectsRequest.q, getSearchProjectsRequest.page);
  }

  @override
  Future<OfficesResponse> getOffices(int page) async {
    return await _appServiceClient.getOffices(page);
  }
}
