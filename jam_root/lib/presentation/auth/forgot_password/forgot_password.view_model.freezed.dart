// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password.view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordModel {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordModelCopyWith<ForgotPasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordModelCopyWith<$Res> {
  factory $ForgotPasswordModelCopyWith(
          ForgotPasswordModel value, $Res Function(ForgotPasswordModel) then) =
      _$ForgotPasswordModelCopyWithImpl<$Res, ForgotPasswordModel>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordModelCopyWithImpl<$Res, $Val extends ForgotPasswordModel>
    implements $ForgotPasswordModelCopyWith<$Res> {
  _$ForgotPasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordModelImplCopyWith<$Res>
    implements $ForgotPasswordModelCopyWith<$Res> {
  factory _$$ForgotPasswordModelImplCopyWith(_$ForgotPasswordModelImpl value,
          $Res Function(_$ForgotPasswordModelImpl) then) =
      __$$ForgotPasswordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordModelImplCopyWithImpl<$Res>
    extends _$ForgotPasswordModelCopyWithImpl<$Res, _$ForgotPasswordModelImpl>
    implements _$$ForgotPasswordModelImplCopyWith<$Res> {
  __$$ForgotPasswordModelImplCopyWithImpl(_$ForgotPasswordModelImpl _value,
      $Res Function(_$ForgotPasswordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordModelImpl implements _ForgotPasswordModel {
  const _$ForgotPasswordModelImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordModelImplCopyWith<_$ForgotPasswordModelImpl> get copyWith =>
      __$$ForgotPasswordModelImplCopyWithImpl<_$ForgotPasswordModelImpl>(
          this, _$identity);
}

abstract class _ForgotPasswordModel implements ForgotPasswordModel {
  const factory _ForgotPasswordModel({required final String email}) =
      _$ForgotPasswordModelImpl;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordModelImplCopyWith<_$ForgotPasswordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
