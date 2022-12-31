// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_LoginObject(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.username, this.password);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String username, final String password) =
      _$_LoginObject;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectsObject {
  List<Project> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get current => throw _privateConstructorUsedError;
  int get last => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsObjectCopyWith<ProjectsObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsObjectCopyWith<$Res> {
  factory $ProjectsObjectCopyWith(
          ProjectsObject value, $Res Function(ProjectsObject) then) =
      _$ProjectsObjectCopyWithImpl<$Res, ProjectsObject>;
  @useResult
  $Res call(
      {List<Project> data, int total, int current, int last, int pageSize});
}

/// @nodoc
class _$ProjectsObjectCopyWithImpl<$Res, $Val extends ProjectsObject>
    implements $ProjectsObjectCopyWith<$Res> {
  _$ProjectsObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? current = null,
    Object? last = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectsObjectCopyWith<$Res>
    implements $ProjectsObjectCopyWith<$Res> {
  factory _$$_ProjectsObjectCopyWith(
          _$_ProjectsObject value, $Res Function(_$_ProjectsObject) then) =
      __$$_ProjectsObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Project> data, int total, int current, int last, int pageSize});
}

/// @nodoc
class __$$_ProjectsObjectCopyWithImpl<$Res>
    extends _$ProjectsObjectCopyWithImpl<$Res, _$_ProjectsObject>
    implements _$$_ProjectsObjectCopyWith<$Res> {
  __$$_ProjectsObjectCopyWithImpl(
      _$_ProjectsObject _value, $Res Function(_$_ProjectsObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? current = null,
    Object? last = null,
    Object? pageSize = null,
  }) {
    return _then(_$_ProjectsObject(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProjectsObject implements _ProjectsObject {
  _$_ProjectsObject(final List<Project> data, this.total, this.current,
      this.last, this.pageSize)
      : _data = data;

  final List<Project> _data;
  @override
  List<Project> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final int current;
  @override
  final int last;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'ProjectsObject(data: $data, total: $total, current: $current, last: $last, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectsObject &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      current,
      last,
      pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectsObjectCopyWith<_$_ProjectsObject> get copyWith =>
      __$$_ProjectsObjectCopyWithImpl<_$_ProjectsObject>(this, _$identity);
}

abstract class _ProjectsObject implements ProjectsObject {
  factory _ProjectsObject(
      final List<Project> data,
      final int total,
      final int current,
      final int last,
      final int pageSize) = _$_ProjectsObject;

  @override
  List<Project> get data;
  @override
  int get total;
  @override
  int get current;
  @override
  int get last;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectsObjectCopyWith<_$_ProjectsObject> get copyWith =>
      throw _privateConstructorUsedError;
}
