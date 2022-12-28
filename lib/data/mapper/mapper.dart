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

extension DashboardResponseMapper on DashboardResponse {
  Dashboard toDomain() {
    // implement dashboard
    List<PipsStatus> statuses =
        (pipsStatuses?.map((status) => status.toDomain()) ??
                const Iterable.empty())
            .cast<PipsStatus>()
            .toList();

    return Dashboard(
      statuses,
      total?.orZero() ?? ZERO,
      validated?.orZero() ?? ZERO,
      endorsed?.orZero() ?? ZERO,
    );
  }
}

extension PipsStatusesReponseMapper on PipsStatusResponse {
  PipsStatus toDomain() {
    return PipsStatus(id, name, color, description, projectsCount);
  }
}

// map notifications response
extension NotificationsResponseMapper on NotificationsResponse {
  List<NotificationItem> toDomain() {
    // implement toDomain
    List<NotificationItem> mappedData =
        (data?.map((notification) => notification.toDomain()) ??
                const Iterable.empty())
            .cast<NotificationItem>()
            .toList();

    return mappedData;
  }
}

extension NotificationItemMapper on NotificationItemResponse {
  NotificationItem toDomain() {
    // id, NotificationData data, created_at
    NotificationData notificationData = NotificationData(
        data?.subject?.orEmpty() ?? EMPTY,
        data?.sender?.orEmpty() ?? EMPTY,
        data?.message?.orEmpty() ?? EMPTY);

    return NotificationItem(id!, notificationData, createdAt);
  }
}
