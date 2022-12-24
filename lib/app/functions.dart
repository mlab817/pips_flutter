import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:pips_flutter/domain/model/model.dart';

const String unknown = "Unknown";

Future<DeviceInfo> getDeviceDetails() async {
  String name = unknown;
  String? identifier = unknown;
  String? version = unknown;

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.id;
      version = build.version.codename;
    } else if (Platform.isIOS) {
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      identifier = build.identifierForVendor;
      version = build.systemVersion;
    }
  } on PlatformException {
    return DeviceInfo(name, identifier!, version!);
  }

  return DeviceInfo(name, identifier!, version!);
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
