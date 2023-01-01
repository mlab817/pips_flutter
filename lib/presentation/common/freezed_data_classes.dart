import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/model.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
}
