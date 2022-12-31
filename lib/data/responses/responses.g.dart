// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as int?,
      json['uuid'] as String?,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['username'] as String?,
      json['email'] as String?,
      json['position'] as String?,
      json['contact_number'] as String?,
      json['email_verified_at'] as String?,
      json['avatar'] as String?,
      json['is_active'] as bool?,
      json['is_admin'] as bool?,
      json['color'] as String?,
      json['type'] as String?,
      json['welcome_email_at'] == null
          ? null
          : DateTime.parse(json['welcome_email_at'] as String),
      json['deleted_at'] as String?,
      json['office_id'] as int?,
      json['last_login_at'] as String?,
      json['initials'] as String?,
      json['fullname'] as String?,
      json['office'] == null
          ? null
          : OfficeResponse.fromJson(json['office'] as Map<String, dynamic>),
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => OfficeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['welcome_sent'] as bool?,
      (json['all_roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['all_permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': instance.position,
      'contact_number': instance.contactNumber,
      'email_verified_at': instance.emailVerifiedAt,
      'avatar': instance.avatar,
      'is_active': instance.isActive,
      'is_admin': instance.isAdmin,
      'color': instance.color,
      'type': instance.type,
      'welcome_email_at': instance.welcomeEmailAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'office_id': instance.officeId,
      'last_login_at': instance.lastLoginAt,
      'initials': instance.initials,
      'fullname': instance.fullname,
      'office': instance.office,
      'reviews': instance.reviews,
      'welcome_sent': instance.welcomeSent,
      'all_roles': instance.allRoles,
      'all_permissions': instance.allPermissions,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['access_token'] as String?,
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user': instance.user,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      json['status'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) =>
    DashboardResponse(
      (json['pips_statuses'] as List<dynamic>?)
          ?.map((e) => PipsStatusResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int?,
      json['validated'] as int?,
      json['endorsed'] as int?,
    );

Map<String, dynamic> _$DashboardResponseToJson(DashboardResponse instance) =>
    <String, dynamic>{
      'pips_statuses': instance.pipsStatuses,
      'total': instance.total,
      'validated': instance.validated,
      'endorsed': instance.endorsed,
    };

PipsStatusResponse _$PipsStatusResponseFromJson(Map<String, dynamic> json) =>
    PipsStatusResponse(
      json['id'] as int,
      json['name'] as String,
      json['color'] as String,
      json['description'] as String,
      json['projects_count'] as int,
    );

Map<String, dynamic> _$PipsStatusResponseToJson(PipsStatusResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'description': instance.description,
      'projects_count': instance.projectsCount,
    };

NotificationsResponse _$NotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              NotificationItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsResponseToJson(
        NotificationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

NotificationItemResponse _$NotificationItemResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationItemResponse(
      json['id'] as String?,
      json['data'] == null
          ? null
          : NotificationDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      json['created_at'],
    );

Map<String, dynamic> _$NotificationItemResponseToJson(
        NotificationItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'created_at': instance.createdAt,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataResponse(
      json['sender'] as String?,
      json['subject'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'subject': instance.subject,
      'message': instance.message,
    };

ProjectsResponse _$ProjectsResponseFromJson(Map<String, dynamic> json) =>
    ProjectsResponse(
      (json['data'] as List<dynamic>)
          .map((e) => ProjectResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      ProjectsMetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectsResponseToJson(ProjectsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

ProjectsMetaResponse _$ProjectsMetaResponseFromJson(
        Map<String, dynamic> json) =>
    ProjectsMetaResponse(
      ProjectsMetaPaginationResponse.fromJson(
          json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectsMetaResponseToJson(
        ProjectsMetaResponse instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };

ProjectsMetaPaginationResponse _$ProjectsMetaPaginationResponseFromJson(
        Map<String, dynamic> json) =>
    ProjectsMetaPaginationResponse(
      json['total'] as int?,
      json['pageSize'] as int?,
      json['current'] as int?,
      json['last'] as int?,
    );

Map<String, dynamic> _$ProjectsMetaPaginationResponseToJson(
        ProjectsMetaPaginationResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pageSize': instance.pageSize,
      'current': instance.current,
      'last': instance.last,
    };

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) =>
    ProjectResponse(
      json['id'] as int?,
      json['uuid'] as String?,
      json['title'] as String?,
      json['office'] == null
          ? null
          : OfficeResponse.fromJson(json['office'] as Map<String, dynamic>),
      json['permission'] == null
          ? null
          : PermissionResponse.fromJson(
              json['permission'] as Map<String, dynamic>),
      json['is_locked'] as bool?,
    );

Map<String, dynamic> _$ProjectResponseToJson(ProjectResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'office': instance.office,
      'permission': instance.permission,
      'is_locked': instance.isLocked,
    };

OfficeResponse _$OfficeResponseFromJson(Map<String, dynamic> json) =>
    OfficeResponse()
      ..id = json['id'] as int?
      ..uuid = json['uuid'] as String?
      ..name = json['name'] as String?
      ..acronym = json['acronym'] as String?
      ..headName = json['head_name'] as String?
      ..headPosition = json['head_position'] as String?
      ..email = json['email'] as String?
      ..phoneNumber = json['phone_number'] as String?
      ..operatingUnitId = json['operating_unit_id'] as int?
      ..color = json['color'] as String?
      ..agencyId = json['agency_id'] as int?
      ..projectsCount = json['projects_count'] as int?
      ..usersCount = json['users_count'] as int?
      ..operatingUnit = json['operating_unit'] == null
          ? null
          : OperatingUnitResponse.fromJson(
              json['operating_unit'] as Map<String, dynamic>)
      ..permissions = json['permissions'] == null
          ? null
          : PermissionsResponse.fromJson(
              json['permissions'] as Map<String, dynamic>);

Map<String, dynamic> _$OfficeResponseToJson(OfficeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'acronym': instance.acronym,
      'head_name': instance.headName,
      'head_position': instance.headPosition,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'operating_unit_id': instance.operatingUnitId,
      'color': instance.color,
      'agency_id': instance.agencyId,
      'projects_count': instance.projectsCount,
      'users_count': instance.usersCount,
      'operating_unit': instance.operatingUnit,
      'permissions': instance.permissions,
    };

OperatingUnitResponse _$OperatingUnitResponseFromJson(
        Map<String, dynamic> json) =>
    OperatingUnitResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['acronym'] as String?,
      json['uacs_code'] as String?,
      json['agency_id'] as int?,
    );

Map<String, dynamic> _$OperatingUnitResponseToJson(
        OperatingUnitResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'acronym': instance.acronym,
      'uacs_code': instance.uacsCode,
      'agency_id': instance.agencyId,
    };

PermissionResponse _$PermissionResponseFromJson(Map<String, dynamic> json) =>
    PermissionResponse(
      json['view'] as bool?,
      json['update'] as bool?,
      json['delete'] as bool?,
      json['lock'] as bool?,
      json['unlock'] as bool?,
      json['validate'] as bool?,
      json['drop'] as bool?,
      json['updatePipol'] as bool?,
    );

Map<String, dynamic> _$PermissionResponseToJson(PermissionResponse instance) =>
    <String, dynamic>{
      'view': instance.view,
      'update': instance.update,
      'delete': instance.delete,
      'lock': instance.lock,
      'unlock': instance.unlock,
      'validate': instance.validate,
      'drop': instance.drop,
      'updatePipol': instance.updatePipol,
    };

PermissionsResponse _$PermissionsResponseFromJson(Map<String, dynamic> json) =>
    PermissionsResponse(
      json['view'] as bool?,
      json['update'] as bool?,
      json['delete'] as bool?,
    );

Map<String, dynamic> _$PermissionsResponseToJson(
        PermissionsResponse instance) =>
    <String, dynamic>{
      'view': instance.view,
      'update': instance.update,
      'delete': instance.delete,
    };
