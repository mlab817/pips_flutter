import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/model.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
}

@freezed
class ProjectsObject with _$ProjectsObject {
  factory ProjectsObject(
          List<Project> data, int total, int current, int last, int pageSize) =
      _ProjectsObject;
}
