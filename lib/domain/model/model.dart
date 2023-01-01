// model for slider object
import 'dart:convert';

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

String userToJson(User user) => user.toJson();

class User {
  User({
    required this.id,
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.contactNumber,
    required this.username,
    required this.email,
    this.emailVerifiedAt,
    this.avatar,
    required this.isActive,
    required this.isAdmin,
    required this.color,
    required this.type,
    this.welcomeEmailAt,
    this.deletedAt,
    required this.officeId,
    this.lastLoginAt,
    required this.initials,
    required this.fullname,
    this.office,
    this.reviews,
    required this.welcomeSent,
    this.allRoles,
    this.allPermissions,
  });

  int id;
  String uuid;
  String firstName;
  String lastName;
  String position;
  String contactNumber;
  String username;
  String email;
  DateTime? emailVerifiedAt;
  String? avatar;
  bool isActive;
  bool isAdmin;
  String color;
  String type;
  DateTime? welcomeEmailAt;
  DateTime? deletedAt;
  int officeId;
  DateTime? lastLoginAt;
  String initials;
  String fullname;
  Office? office;
  List<Office>? reviews;
  bool welcomeSent;
  List<String>? allRoles;
  List<String>? allPermissions;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        uuid: json["uuid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        position: json["position"],
        contactNumber: json["contact_number"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        avatar: json["avatar"],
        isActive: json["is_active"],
        isAdmin: json["is_admin"],
        color: json["color"],
        type: json["type"],
        welcomeEmailAt: json["welcome_email_at"],
        deletedAt: json["deleted_at"],
        officeId: json["office_id"],
        lastLoginAt: DateTime.parse(json["last_login_at"]),
        initials: json["initials"],
        fullname: json["fullname"],
        office: Office.fromMap(json["office"]),
        reviews:
            List<Office>.from(json["reviews"].map((x) => Office.fromMap(x))),
        welcomeSent: json["welcome_sent"],
        allRoles: List<String>.from(json["all_roles"].map((x) => x)),
        allPermissions:
            List<String>.from(json["all_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uuid": uuid,
        "first_name": firstName,
        "last_name": lastName,
        "position": position,
        "contact_number": contactNumber,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "avatar": avatar,
        "is_active": isActive,
        "is_admin": isAdmin,
        "color": color,
        "type": type,
        "welcome_email_at": welcomeEmailAt,
        "deleted_at": deletedAt,
        "office_id": officeId,
        "last_login_at": lastLoginAt.toString(),
        "initials": initials,
        "fullname": fullname,
        "office": office?.toMap(),
        "reviews": List<Office>.from(
                (reviews?.map((x) => x.toMap())) ?? const Iterable.empty())
            .cast<Office>()
            .toList(),
        "welcome_sent": welcomeSent,
        "all_roles": List<String>.from(
                (allRoles?.map((x) => x)) ?? const Iterable.empty())
            .cast<String>()
            .toList(),
        "all_permissions": List<String>.from(
                (allPermissions?.map((x) => x)) ?? const Iterable.empty())
            .cast<String>()
            .toList(),
      };
}

class Authentication {
  String? accessToken;

  User? user;

  Authentication(this.accessToken, this.user);
}

class ForgotPassword {
  String? status;

  ForgotPassword(this.status);
}

class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}

class Dashboard {
  List<PipsStatus> pipsStatuses;
  int total;
  int validated;
  int endorsed;

  Dashboard(this.pipsStatuses, this.total, this.validated, this.endorsed);
}

class PipsStatus {
  int id;
  String name;
  String color;
  String description;
  int projectsCount;

  PipsStatus(
      this.id, this.name, this.color, this.description, this.projectsCount);
}

class NotificationItem {
  String id;

  NotificationData data;

  String? createdAt;

  NotificationItem(this.id, this.data, this.createdAt);
}

class NotificationData {
  String sender;

  String subject;

  String message;

  NotificationData(this.subject, this.sender, this.message);
}

class Projects {
  List<Project> data;

  int total;
  int current;
  int last;
  int pageSize;

  Projects(this.data, this.total, this.current, this.last, this.pageSize);
}

class Project {
  int id;

  String uuid;

  String title;

  Office? office;

  Permission? permission;

  bool isLocked;

  double? totalCost;

  DateTime? updatedAt;

  Project(
    this.id,
    this.uuid,
    this.title,
    this.office,
    this.permission,
    this.isLocked,
    this.totalCost,
    this.updatedAt,
  );
}

class Office {
  Office({
    required this.id,
    required this.uuid,
    required this.name,
    required this.acronym,
    required this.headName,
    required this.headPosition,
    required this.email,
    required this.phoneNumber,
    required this.operatingUnitId,
    this.imageUrl,
    required this.color,
    required this.agencyId,
    this.permissions,
    required this.projectsCount,
    required this.usersCount,
    this.operatingUnit,
    this.operatingUnitName,
  });

  final int id;
  final String uuid;
  final String name;
  final String acronym;
  final String headName;
  final String headPosition;
  final String email;
  final String phoneNumber;
  final int operatingUnitId;
  final dynamic imageUrl;
  final String color;
  final int agencyId;
  final Permissions? permissions;
  final int projectsCount;
  final int usersCount;
  final OperatingUnit? operatingUnit;
  final String? operatingUnitName;

  factory Office.fromJson(String str) => Office.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Office.fromMap(Map<String, dynamic> json) => Office(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        acronym: json["acronym"],
        headName: json["head_name"],
        headPosition: json["head_position"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        operatingUnitId: json["operating_unit_id"],
        imageUrl: json["image_url"],
        color: json["color"],
        agencyId: json["agency_id"],
        permissions: Permissions.fromMap(json["permissions"]),
        projectsCount: json["projects_count"],
        usersCount: json["users_count"],
        operatingUnit: OperatingUnit.fromMap(json["operating_unit"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "acronym": acronym,
        "head_name": headName,
        "head_position": headPosition,
        "email": email,
        "phone_number": phoneNumber,
        "operating_unit_id": operatingUnitId,
        "image_url": imageUrl,
        "color": color,
        "agency_id": agencyId,
        "permissions": permissions?.toMap(),
        "projects_count": projectsCount,
        "users_count": usersCount,
        "operating_unit": operatingUnit?.toMap(),
      };
}

class Permission {
  bool view;
  bool update;
  bool delete;
  bool lock;
  bool unlock;
  bool validate;
  bool drop;
  bool updatePipol;

  Permission(this.view, this.update, this.delete, this.lock, this.unlock,
      this.validate, this.drop, this.updatePipol);
}

class PdfFile {
  List<int> data;

  PdfFile(this.data);
}

class OperatingUnit {
  OperatingUnit({
    required this.id,
    required this.name,
    required this.acronym,
    required this.uacsCode,
    this.imageUrl,
    required this.agencyId,
    this.agencyName,
  });

  final int id;
  final String name;
  final String acronym;
  final String uacsCode;
  final dynamic imageUrl;
  final int agencyId;
  final String? agencyName;

  factory OperatingUnit.fromJson(String str) =>
      OperatingUnit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OperatingUnit.fromMap(Map<String, dynamic> json) => OperatingUnit(
        id: json["id"],
        name: json["name"],
        acronym: json["acronym"],
        uacsCode: json["uacs_code"],
        imageUrl: json["image_url"],
        agencyId: json["agency_id"],
        agencyName: json["agency"]["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "acronym": acronym,
        "uacs_code": uacsCode,
        "image_url": imageUrl,
        "agency_id": agencyId,
        "agencyName": agencyName,
      };
}

class Permissions {
  Permissions({
    required this.view,
    required this.update,
    required this.delete,
  });

  final bool view;
  final bool update;
  final bool delete;

  factory Permissions.fromJson(String str) =>
      Permissions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Permissions.fromMap(Map<String, dynamic> json) => Permissions(
        view: json["view"],
        update: json["update"],
        delete: json["delete"],
      );

  Map<String, dynamic> toMap() => {
        "view": view,
        "update": update,
        "delete": delete,
      };
}

class Pivot {
  Pivot({
    required this.userId,
    required this.officeId,
  });

  final int userId;
  final int officeId;

  factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        officeId: json["office_id"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "office_id": officeId,
      };
}
