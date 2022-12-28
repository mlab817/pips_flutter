import 'package:dio/dio.dart';
import 'package:pips_flutter/app/constant.dart';
import 'package:pips_flutter/data/responses/responses.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

// annotation allows autogenerate of .g.dart files
@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/auth/login")
  Future<AuthenticationResponse> login(@Field("username") String username,
      @Field("password") String password,);

  @POST("/auth/forgot-password")
  Future<ForgotPasswordResponse> sendPasswordResetEmail(
      @Field("email") String email);

  @GET("/dashboard")
  Future<DashboardResponse> dashboard();

  @GET("/auth/notifications")
  Future<NotificationsResponse> getNotifications();

  @GET("/projects")
  Future<ProjectsResponse> getProjects();
}
