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
