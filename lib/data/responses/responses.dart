import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "uuid")
  String? uuid;

  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "first_name")
  String? firstName;

  @JsonKey(name: "last_name")
  String? lastName;

  @JsonKey(name: "position")
  String? position;

  UserResponse(
      this.id, this.username, this.email, this.firstName, this.lastName);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse {
  @JsonKey(name: "access_token")
  String? accessToken;

  @JsonKey(name: "user")
  UserResponse? user;

  AuthenticationResponse(this.accessToken, this.user);

  // fromJson
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class ForgotPasswordResponse {
  @JsonKey(name: "status")
  String? status;

  ForgotPasswordResponse(this.status);

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  // dynamic because it may be nullable
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}

@JsonSerializable()
class DashboardResponse {
  @JsonKey(name: "pips_statuses")
  List<PipsStatusResponse>? pipsStatuses;

  @JsonKey(name: "total")
  int? total;

  @JsonKey(name: "validated")
  int? validated;

  @JsonKey(name: "endorsed")
  int? endorsed;

  DashboardResponse(
      this.pipsStatuses, this.total, this.validated, this.endorsed);

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardResponseToJson(this);
}

@JsonSerializable()
class PipsStatusResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "color")
  String color;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "projects_count")
  int projectsCount;

  PipsStatusResponse(
      this.id, this.name, this.color, this.description, this.projectsCount);

  factory PipsStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$PipsStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PipsStatusResponseToJson(this);
}

@JsonSerializable()
class NotificationsResponse {
  @JsonKey(name: "data")
  List<NotificationItemResponse>? data;

  NotificationsResponse(this.data);

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}

@JsonSerializable()
class NotificationItemResponse {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "data")
  NotificationDataResponse? data;

  @JsonKey(name: "created_at")
  dynamic createdAt;

  NotificationItemResponse(this.id, this.data, this.createdAt);

  factory NotificationItemResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemResponseToJson(this);
}

@JsonSerializable()
class NotificationDataResponse {
  @JsonKey(name: "sender")
  String? sender;

  @JsonKey(name: "subject")
  String? subject;

  @JsonKey(name: "message")
  String? message;

  NotificationDataResponse(this.sender, this.subject, this.message);

  factory NotificationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataResponseToJson(this);
}
