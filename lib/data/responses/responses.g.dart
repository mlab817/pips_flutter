// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()
    ..status = json['status'] as int?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    json['id'] as int?,
    json['username'] as String?,
    json['email'] as String?,
    json['first_name'] as String?,
    json['last_name'] as String?,
  )
    ..uuid = json['uuid'] as String?
    ..position = json['position'] as String?;
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': instance.position,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResponse(
    json['access_token'] as String?,
    json['user'] == null
        ? null
        : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'user': instance.user,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return ForgotPasswordResponse(
    json['status'] as String?,
  );
}

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) {
  return DashboardResponse(
    (json['pips_statuses'] as List<dynamic>?)
        ?.map((e) => PipsStatusResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['total'] as int?,
    json['validated'] as int?,
    json['endorsed'] as int?,
  );
}

Map<String, dynamic> _$DashboardResponseToJson(DashboardResponse instance) =>
    <String, dynamic>{
      'pips_statuses': instance.pipsStatuses,
      'total': instance.total,
      'validated': instance.validated,
      'endorsed': instance.endorsed,
    };

PipsStatusResponse _$PipsStatusResponseFromJson(Map<String, dynamic> json) {
  return PipsStatusResponse(
    json['id'] as int,
    json['name'] as String,
    json['color'] as String,
    json['description'] as String,
    json['projects_count'] as int,
  );
}

Map<String, dynamic> _$PipsStatusResponseToJson(PipsStatusResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'description': instance.description,
      'projects_count': instance.projectsCount,
    };

NotificationsResponse _$NotificationsResponseFromJson(
    Map<String, dynamic> json) {
  return NotificationsResponse(
    (json['data'] as List<dynamic>?)
        ?.map(
            (e) => NotificationItemResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NotificationsResponseToJson(
        NotificationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

NotificationItemResponse _$NotificationItemResponseFromJson(
    Map<String, dynamic> json) {
  return NotificationItemResponse(
    json['id'] as String?,
    json['data'] == null
        ? null
        : NotificationDataResponse.fromJson(
            json['data'] as Map<String, dynamic>),
    json['created_at'],
  );
}

Map<String, dynamic> _$NotificationItemResponseToJson(
        NotificationItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
      'created_at': instance.createdAt,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
    Map<String, dynamic> json) {
  return NotificationDataResponse(
    json['sender'] as String?,
    json['subject'] as String?,
    json['message'] as String?,
  );
}

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'subject': instance.subject,
      'message': instance.message,
    };

ProjectsResponse _$ProjectsResponseFromJson(Map<String, dynamic> json) {
  return ProjectsResponse(
    (json['data'] as List<dynamic>)
        .map((e) => ProjectResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    ProjectsMetaResponse.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProjectsResponseToJson(ProjectsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

ProjectsMetaResponse _$ProjectsMetaResponseFromJson(Map<String, dynamic> json) {
  return ProjectsMetaResponse(
    ProjectsMetaPaginationResponse.fromJson(
        json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProjectsMetaResponseToJson(
        ProjectsMetaResponse instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };

ProjectsMetaPaginationResponse _$ProjectsMetaPaginationResponseFromJson(
    Map<String, dynamic> json) {
  return ProjectsMetaPaginationResponse(
    json['total'] as int?,
    json['pageSize'] as int?,
    json['current'] as int?,
    json['last'] as int?,
  );
}

Map<String, dynamic> _$ProjectsMetaPaginationResponseToJson(
        ProjectsMetaPaginationResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pageSize': instance.pageSize,
      'current': instance.current,
      'last': instance.last,
    };

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) {
  return ProjectResponse(
    json['key'] as String?,
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
}

Map<String, dynamic> _$ProjectResponseToJson(ProjectResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'uuid': instance.uuid,
      'title': instance.title,
      'office': instance.office,
      'permission': instance.permission,
      'is_locked': instance.isLocked,
    };

OfficeResponse _$OfficeResponseFromJson(Map<String, dynamic> json) {
  return OfficeResponse(
    json['name'] as String?,
    json['acronym'] as String?,
    json['color'] as String?,
  );
}

Map<String, dynamic> _$OfficeResponseToJson(OfficeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'acronym': instance.acronym,
      'color': instance.color,
    };

PermissionResponse _$PermissionResponseFromJson(Map<String, dynamic> json) {
  return PermissionResponse(
    json['view'] as bool?,
    json['update'] as bool?,
    json['delete'] as bool?,
    json['lock'] as bool?,
    json['unlock'] as bool?,
    json['validate'] as bool?,
    json['drop'] as bool?,
    json['updatePipol'] as bool?,
  );
}

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
