import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/model.dart';

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

  @JsonKey(name: "contact_number")
  String? contactNumber;

  @JsonKey(name: "email_verified_at")
  String? emailVerifiedAt;

  @JsonKey(name: "avatar")
  String? avatar;

  @JsonKey(name: "is_active")
  bool? isActive;

  @JsonKey(name: "is_admin")
  bool? isAdmin;

  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "welcome_email_at")
  DateTime? welcomeEmailAt;

  @JsonKey(name: "deleted_at")
  String? deletedAt;

  @JsonKey(name: "office_id")
  int? officeId;

  @JsonKey(name: "last_login_at")
  String? lastLoginAt;

  @JsonKey(name: "initials")
  String? initials;

  @JsonKey(name: "fullname")
  String? fullname;

  @JsonKey(name: "office")
  OfficeResponse? office;

  @JsonKey(name: "reviews")
  List<OfficeResponse>? reviews;

  @JsonKey(name: "welcome_sent")
  bool? welcomeSent;

  @JsonKey(name: "all_roles")
  List<String>? allRoles;

  @JsonKey(name: "all_permissions")
  List<String>? allPermissions;

  UserResponse(this.id,
      this.uuid,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.position,
      this.contactNumber,
      this.emailVerifiedAt,
      this.avatar,
      this.isActive,
      this.isAdmin,
      this.color,
      this.type,
      this.welcomeEmailAt,
      this.deletedAt,
      this.officeId,
      this.lastLoginAt,
      this.initials,
      this.fullname,
      this.office,
      this.reviews,
      this.welcomeSent,
      this.allRoles,
      this.allPermissions);

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

  DashboardResponse(this.pipsStatuses, this.total, this.validated,
      this.endorsed);

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

  PipsStatusResponse(this.id, this.name, this.color, this.description,
      this.projectsCount);

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

  ProjectsMetaPaginationResponse(this.total, this.pageSize, this.current,
      this.last);

  factory ProjectsMetaPaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsMetaPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsMetaPaginationResponseToJson(this);
}

@JsonSerializable()
class ProjectResponse {
  @JsonKey(name: "id")
  int? id;

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

  ProjectResponse(this.id, this.uuid, this.title, this.office, this.permission,
      this.isLocked);

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}

@JsonSerializable()
class OfficeResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "uuid")
  String? uuid;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "acronym")
  String? acronym;

  @JsonKey(name: "head_name")
  String? headName;

  @JsonKey(name: "head_position")
  String? headPosition;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "phone_number")
  String? phoneNumber;

  @JsonKey(name: "operating_unit_id")
  int? operatingUnitId;

  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "agency_id")
  int? agencyId;

  @JsonKey(name: "projects_count")
  int? projectsCount;

  @JsonKey(name: "users_count")
  int? usersCount;

  @JsonKey(name: "operating_unit")
  OperatingUnitResponse? operatingUnit;

  @JsonKey(name: "permissions")
  PermissionsResponse? permissions;

  OfficeResponse();

  factory OfficeResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeResponseToJson(this);
}

@JsonSerializable()
class OperatingUnitResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "acronym")
  String? acronym;

  @JsonKey(name: "uacs_code")
  String? uacsCode;

  @JsonKey(name: "agency_id")
  int? agencyId;

  OperatingUnitResponse(this.id, this.name, this.acronym, this.uacsCode,
      this.agencyId);

  factory OperatingUnitResponse.fromJson(Map<String, dynamic> json) =>
      _$OperatingUnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OperatingUnitResponseToJson(this);
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


@JsonSerializable()
class PermissionsResponse {
  @JsonKey(name: "view")
  bool? view;

  @JsonKey(name: "update")
  bool? update;

  @JsonKey(name: "delete")
  bool? delete;

  PermissionsResponse(this.view, this.update, this.delete);

  factory PermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsResponseToJson(this);
}