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
