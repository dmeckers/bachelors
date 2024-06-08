// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterModel {
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  bool get agreeWithTerms => throw _privateConstructorUsedError;
  List<VibeModel> get vibes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterModelCopyWith<RegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterModelCopyWith<$Res> {
  factory $RegisterModelCopyWith(
          RegisterModel value, $Res Function(RegisterModel) then) =
      _$RegisterModelCopyWithImpl<$Res, RegisterModel>;
  @useResult
  $Res call(
      {String email,
      String fullName,
      String password,
      String confirmPassword,
      bool agreeWithTerms,
      List<VibeModel> vibes});
}

/// @nodoc
class _$RegisterModelCopyWithImpl<$Res, $Val extends RegisterModel>
    implements $RegisterModelCopyWith<$Res> {
  _$RegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? agreeWithTerms = null,
    Object? vibes = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      agreeWithTerms: null == agreeWithTerms
          ? _value.agreeWithTerms
          : agreeWithTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      vibes: null == vibes
          ? _value.vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterModelImplCopyWith<$Res>
    implements $RegisterModelCopyWith<$Res> {
  factory _$$RegisterModelImplCopyWith(
          _$RegisterModelImpl value, $Res Function(_$RegisterModelImpl) then) =
      __$$RegisterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String fullName,
      String password,
      String confirmPassword,
      bool agreeWithTerms,
      List<VibeModel> vibes});
}

/// @nodoc
class __$$RegisterModelImplCopyWithImpl<$Res>
    extends _$RegisterModelCopyWithImpl<$Res, _$RegisterModelImpl>
    implements _$$RegisterModelImplCopyWith<$Res> {
  __$$RegisterModelImplCopyWithImpl(
      _$RegisterModelImpl _value, $Res Function(_$RegisterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? agreeWithTerms = null,
    Object? vibes = null,
  }) {
    return _then(_$RegisterModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      agreeWithTerms: null == agreeWithTerms
          ? _value.agreeWithTerms
          : agreeWithTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      vibes: null == vibes
          ? _value._vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
    ));
  }
}

/// @nodoc

class _$RegisterModelImpl extends _RegisterModel {
  const _$RegisterModelImpl(
      {this.email = '',
      this.fullName = '',
      this.password = '',
      this.confirmPassword = '',
      this.agreeWithTerms = false,
      final List<VibeModel> vibes = const []})
      : _vibes = vibes,
        super._();

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final bool agreeWithTerms;
  final List<VibeModel> _vibes;
  @override
  @JsonKey()
  List<VibeModel> get vibes {
    if (_vibes is EqualUnmodifiableListView) return _vibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vibes);
  }

  @override
  String toString() {
    return 'RegisterModel(email: $email, fullName: $fullName, password: $password, confirmPassword: $confirmPassword, agreeWithTerms: $agreeWithTerms, vibes: $vibes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.agreeWithTerms, agreeWithTerms) ||
                other.agreeWithTerms == agreeWithTerms) &&
            const DeepCollectionEquality().equals(other._vibes, _vibes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      fullName,
      password,
      confirmPassword,
      agreeWithTerms,
      const DeepCollectionEquality().hash(_vibes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterModelImplCopyWith<_$RegisterModelImpl> get copyWith =>
      __$$RegisterModelImplCopyWithImpl<_$RegisterModelImpl>(this, _$identity);
}

abstract class _RegisterModel extends RegisterModel {
  const factory _RegisterModel(
      {final String email,
      final String fullName,
      final String password,
      final String confirmPassword,
      final bool agreeWithTerms,
      final List<VibeModel> vibes}) = _$RegisterModelImpl;
  const _RegisterModel._() : super._();

  @override
  String get email;
  @override
  String get fullName;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  bool get agreeWithTerms;
  @override
  List<VibeModel> get vibes;
  @override
  @JsonKey(ignore: true)
  _$$RegisterModelImplCopyWith<_$RegisterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
