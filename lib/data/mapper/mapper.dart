// convert response into non-nullable objects (model)
import 'package:dartz/dartz.dart';
import 'package:pips_flutter/app/extensions.dart';
import 'package:pips_flutter/data/responses/responses.dart';
import 'package:pips_flutter/domain/model/model.dart';

const emptyString = "";
const zeroInt = 0;
const oneInt = 1;

extension UserResponseMapper on UserResponse? {
  // convert response from data layer to domain layer
  User toDomain() {
    List<Office> officesForReview =
        (this?.reviews?.map((review) => review.toDomain()) ??
                const Iterable.empty())
            .cast<Office>()
            .toList();

    return User(
        id: this?.id?.orZero() ?? zeroInt,
        uuid: this?.uuid?.orEmpty() ?? emptyString,
        firstName: this?.firstName?.orEmpty() ?? emptyString,
        lastName: this?.lastName?.orEmpty() ?? emptyString,
        username: this?.username?.orEmpty() ?? emptyString,
        email: this?.email?.orEmpty() ?? emptyString,
        position: this?.position?.orEmpty() ?? emptyString,
        contactNumber: this?.contactNumber?.orEmpty() ?? emptyString,
        // this?.emailVerifiedAt?.orEmpty() ?? EMPTY,
        emailVerifiedAt: DateTime.now(),
        avatar: this?.avatar,
        isActive: this?.isActive ?? false,
        isAdmin: this?.isAdmin ?? false,
        color: this?.color?.orEmpty() ?? emptyString,
        type: this?.type?.orEmpty() ?? emptyString,
        // DateTime.parse(this?.welcomeEmailAt),
        welcomeEmailAt: DateTime.now(),
        // this?.deletedAt,
        deletedAt: DateTime.now(),
        officeId: this?.officeId?.orZero() ?? zeroInt,
        // this?.lastLoginAt,
        lastLoginAt: DateTime.now(),
        initials: this?.initials?.orEmpty() ?? emptyString,
        fullname: this?.fullname?.orEmpty() ?? emptyString,
        office: this?.office?.toDomain(),
        reviews: officesForReview,
        // mapped offices for review
        welcomeSent: this?.welcomeSent ?? false,
        allRoles: this?.allRoles,
        allPermissions: this?.allPermissions);
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
      total?.orZero() ?? zeroInt,
      validated?.orZero() ?? zeroInt,
      endorsed?.orZero() ?? zeroInt,
    );
  }
}

extension PipsStatusesReponseMapper on PipsStatusResponse {
  PipsStatus toDomain() {
    return PipsStatus(this.id, name, color, description, projectsCount);
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
        data?.subject?.orEmpty() ?? emptyString,
        data?.sender?.orEmpty() ?? emptyString,
        data?.message?.orEmpty() ?? emptyString);

    return NotificationItem(
        this.id?.orEmpty() ?? emptyString, notificationData, createdAt);
  }
}

extension ProjectsResponseMapper on ProjectsResponse {
  Projects toDomain() {
    List<Project> projects =
        data.map((project) => project.toDomain()).cast<Project>().toList();

    return Projects(
        projects,
        meta.pagination.total?.orZero() ?? zeroInt,
        meta.pagination.pageSize?.orZero() ?? 25,
        meta.pagination.current?.orZero() ?? oneInt,
        meta.pagination.last?.orZero() ?? oneInt);
  }
}

extension ProjectResponseMapper on ProjectResponse {
  Project toDomain() {
    return Project(
        this.id ?? zeroInt,
        uuid ?? emptyString,
        title ?? emptyString,
        office?.toDomain(),
        permission?.toDomain(),
        isLocked ?? false);
  }
}

extension OfficeResponseMapper on OfficeResponse {
  Office toDomain() {
    return Office(
      id: this.id.orZero() ?? zeroInt,
      uuid: uuid?.orEmpty() ?? emptyString,
      name: name?.orEmpty() ?? emptyString,
      acronym: acronym?.orEmpty() ?? emptyString,
      headName: headName?.orEmpty() ?? emptyString,
      headPosition: headPosition?.orEmpty() ?? emptyString,
      email: email?.orEmpty() ?? emptyString,
      phoneNumber: phoneNumber?.orEmpty() ?? emptyString,
      operatingUnitId: operatingUnitId?.orZero() ?? zeroInt,
      color: color?.orEmpty() ?? emptyString,
      agencyId: agencyId?.orZero() ?? zeroInt,
      permissions: permissions?.toDomain(),
      projectsCount: projectsCount?.orZero() ?? zeroInt,
      usersCount: usersCount?.orZero() ?? zeroInt,
      operatingUnit: operatingUnit?.toDomain(),
    );
  }
}

extension PermissionsResponseMapper on PermissionsResponse {
  Permissions toDomain() {
    return Permissions(
        view: view ?? false, update: update ?? false, delete: delete ?? false);
  }
}

extension PermissionResponseMapper on PermissionResponse {
  Permission toDomain() {
    return Permission(
        view ?? false,
        update ?? false,
        delete ?? false,
        lock ?? false,
        unlock ?? false,
        validate ?? false,
        drop ?? false,
        updatePipol ?? false);
  }
}

extension OperatingUnitResponseMapper on OperatingUnitResponse {
  OperatingUnit toDomain() {
    return OperatingUnit(
        id: this.id?.orZero() ?? zeroInt,
        name: name?.orEmpty() ?? emptyString,
        acronym: acronym?.orEmpty() ?? emptyString,
        uacsCode: uacsCode?.orEmpty() ?? emptyString,
        agencyId: agencyId?.orZero() ?? zeroInt);
  }
}
