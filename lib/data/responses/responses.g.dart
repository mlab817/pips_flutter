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
