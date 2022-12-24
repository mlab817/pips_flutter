// convert response into non-nullable objects (model)

import 'package:pips_flutter/app/extensions.dart';
import 'package:pips_flutter/data/responses/responses.dart';
import 'package:pips_flutter/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;

extension UserResponseMapper on UserResponse? {
  // convert response from data layer to domain layer
  User toDomain() {
    return User(
      this?.id?.orZero() ?? ZERO,
      this?.uuid?.orEmpty() ?? EMPTY,
      this?.firstName?.orEmpty() ?? EMPTY,
      this?.lastName?.orEmpty() ?? EMPTY,
      this?.username?.orEmpty() ?? EMPTY,
      this?.email?.orEmpty() ?? EMPTY,
      this?.position?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.accessToken, this?.user?.toDomain());
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  ForgotPassword toDomain() {
    return ForgotPassword(this?.status);
  }
}
