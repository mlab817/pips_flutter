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

@JsonSerializable()
class ProjectsResponse {
  @JsonKey(name: "data")
  List<ProjectResponse> data;

  @JsonKey(name: "meta")
  ProjectsMetaResponse meta;

  ProjectsResponse(this.data, this.meta);

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsResponseToJson(this);
}

@JsonSerializable()
class ProjectsMetaResponse {
  @JsonKey(name: "pagination")
  ProjectsMetaPaginationResponse pagination;

  ProjectsMetaResponse(this.pagination);

  factory ProjectsMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsMetaResponseToJson(this);
}

@JsonSerializable()
class ProjectsMetaPaginationResponse {
  @JsonKey(name: "total")
  int? total;

  @JsonKey(name: "pageSize")
  int? pageSize;

  @JsonKey(name: "current")
  int? current;

  @JsonKey(name: "last")
  int? last;

  ProjectsMetaPaginationResponse(
      this.total, this.pageSize, this.current, this.last);

  factory ProjectsMetaPaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsMetaPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsMetaPaginationResponseToJson(this);
}

@JsonSerializable()
class ProjectResponse {
  @JsonKey(name: "key")
  String? key;

  @JsonKey(name: "uuid")
  String? uuid;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "office")
  OfficeResponse? office;

  @JsonKey(name: "permission")
  PermissionResponse? permission;

  @JsonKey(name: "is_locked")
  bool? isLocked;

  ProjectResponse(this.key, this.uuid, this.title, this.office, this.permission,
      this.isLocked);

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}

@JsonSerializable()
class OfficeResponse {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "acronym")
  String? acronym;

  @JsonKey(name: "color")
  String? color;

  OfficeResponse(this.name, this.acronym, this.color);

  factory OfficeResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeResponseToJson(this);
}

@JsonSerializable()
class PermissionResponse {
  @JsonKey(name: "view")
  bool? view;

  @JsonKey(name: "update")
  bool? update;

  @JsonKey(name: "delete")
  bool? delete;

  @JsonKey(name: "lock")
  bool? lock;

  @JsonKey(name: "unlock")
  bool? unlock;

  @JsonKey(name: "validate")
  bool? validate;

  @JsonKey(name: "drop")
  bool? drop;

  @JsonKey(name: "updatePipol")
  bool? updatePipol;

  PermissionResponse(this.view, this.update, this.delete, this.lock,
      this.unlock, this.validate, this.drop, this.updatePipol);

  factory PermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionResponseToJson(this);
}
