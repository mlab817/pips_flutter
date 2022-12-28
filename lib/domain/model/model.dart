// model for slider object
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class User {
  int id;
  String uuid;
  String firstName;
  String lastName;
  String username;
  String email;
  String position;

  User(this.id, this.uuid, this.firstName, this.lastName, this.username,
      this.email, this.position);
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

  DateTime? createdAt;

  NotificationItem(this.id, this.data, this.createdAt);
}

class NotificationData {
  String sender;

  String subject;

  String message;

  NotificationData(this.subject, this.sender, this.message);
}
