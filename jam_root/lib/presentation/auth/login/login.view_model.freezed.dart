// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login.view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginPageModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageModelCopyWith<LoginPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageModelCopyWith<$Res> {
  factory $LoginPageModelCopyWith(
          LoginPageModel value, $Res Function(LoginPageModel) then) =
      _$LoginPageModelCopyWithImpl<$Res, LoginPageModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginPageModelCopyWithImpl<$Res, $Val extends LoginPageModel>
    implements $LoginPageModelCopyWith<$Res> {
  _$LoginPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginPageModelImplCopyWith<$Res>
    implements $LoginPageModelCopyWith<$Res> {
  factory _$$LoginPageModelImplCopyWith(_$LoginPageModelImpl value,
          $Res Function(_$LoginPageModelImpl) then) =
      __$$LoginPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginPageModelImplCopyWithImpl<$Res>
    extends _$LoginPageModelCopyWithImpl<$Res, _$LoginPageModelImpl>
    implements _$$LoginPageModelImplCopyWith<$Res> {
  __$$LoginPageModelImplCopyWithImpl(
      _$LoginPageModelImpl _value, $Res Function(_$LoginPageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginPageModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginPageModelImpl extends _LoginPageModel {
  const _$LoginPageModelImpl({required this.email, required this.password})
      : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginPageModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPageModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginPageModelImplCopyWith<_$LoginPageModelImpl> get copyWith =>
      __$$LoginPageModelImplCopyWithImpl<_$LoginPageModelImpl>(
          this, _$identity);
}

abstract class _LoginPageModel extends LoginPageModel {
  const factory _LoginPageModel(
      {required final String email,
      required final String password}) = _$LoginPageModelImpl;
  const _LoginPageModel._() : super._();

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginPageModelImplCopyWith<_$LoginPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
