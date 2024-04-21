// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'signedIn':
      return JUser.fromJson(json);
    case 'signedOut':
      return SignedOut.fromJson(json);
    case 'passwordRecovery':
      return PasswordRecovery.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppUser',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppUser {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uid,
            String displayName,
            String email,
            String phone,
            String token,
            DateTime? lastSignIn,
            UserProfileModel? userProfile)
        signedIn,
    required TResult Function() signedOut,
    required TResult Function() passwordRecovery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uid,
            String displayName,
            String email,
            String phone,
            String token,
            DateTime? lastSignIn,
            UserProfileModel? userProfile)?
        signedIn,
    TResult? Function()? signedOut,
    TResult? Function()? passwordRecovery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, String displayName, String email, String phone,
            String token, DateTime? lastSignIn, UserProfileModel? userProfile)?
        signedIn,
    TResult Function()? signedOut,
    TResult Function()? passwordRecovery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JUser value) signedIn,
    required TResult Function(SignedOut value) signedOut,
    required TResult Function(PasswordRecovery value) passwordRecovery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JUser value)? signedIn,
    TResult? Function(SignedOut value)? signedOut,
    TResult? Function(PasswordRecovery value)? passwordRecovery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JUser value)? signedIn,
    TResult Function(SignedOut value)? signedOut,
    TResult Function(PasswordRecovery value)? passwordRecovery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$JUserImplCopyWith<$Res> {
  factory _$$JUserImplCopyWith(
          _$JUserImpl value, $Res Function(_$JUserImpl) then) =
      __$$JUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String uid,
      String displayName,
      String email,
      String phone,
      String token,
      DateTime? lastSignIn,
      UserProfileModel? userProfile});

  $UserProfileModelCopyWith<$Res>? get userProfile;
}

/// @nodoc
class __$$JUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$JUserImpl>
    implements _$$JUserImplCopyWith<$Res> {
  __$$JUserImplCopyWithImpl(
      _$JUserImpl _value, $Res Function(_$JUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? displayName = null,
    Object? email = null,
    Object? phone = null,
    Object? token = null,
    Object? lastSignIn = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_$JUserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      lastSignIn: freezed == lastSignIn
          ? _value.lastSignIn
          : lastSignIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileModelCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$JUserImpl extends JUser {
  const _$JUserImpl(
      {required this.uid,
      required this.displayName,
      required this.email,
      required this.phone,
      this.token = '',
      this.lastSignIn = null,
      this.userProfile = null,
      final String? $type})
      : $type = $type ?? 'signedIn',
        super._();

  factory _$JUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$JUserImplFromJson(json);

  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String phone;
  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey()
  final DateTime? lastSignIn;
  @override
  @JsonKey()
  final UserProfileModel? userProfile;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.signedIn(uid: $uid, displayName: $displayName, email: $email, phone: $phone, token: $token, lastSignIn: $lastSignIn, userProfile: $userProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.lastSignIn, lastSignIn) ||
                other.lastSignIn == lastSignIn) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, displayName, email, phone,
      token, lastSignIn, userProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JUserImplCopyWith<_$JUserImpl> get copyWith =>
      __$$JUserImplCopyWithImpl<_$JUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uid,
            String displayName,
            String email,
            String phone,
            String token,
            DateTime? lastSignIn,
            UserProfileModel? userProfile)
        signedIn,
    required TResult Function() signedOut,
    required TResult Function() passwordRecovery,
  }) {
    return signedIn(
        uid, displayName, email, phone, token, lastSignIn, userProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uid,
            String displayName,
            String email,
            String phone,
            String token,
            DateTime? lastSignIn,
            UserProfileModel? userProfile)?
        signedIn,
    TResult? Function()? signedOut,
    TResult? Function()? passwordRecovery,
  }) {
    return signedIn?.call(
        uid, displayName, email, phone, token, lastSignIn, userProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, String displayName, String email, String phone,
            String token, DateTime? lastSignIn, UserProfileModel? userProfile)?
        signedIn,
    TResult Function()? signedOut,
    TResult Function()? passwordRecovery,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(
          uid, displayName, email, phone, token, lastSignIn, userProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JUser value) signedIn,
    required TResult Function(SignedOut value) signedOut,
    required TResult Function(PasswordRecovery value) passwordRecovery,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JUser value)? signedIn,
    TResult? Function(SignedOut value)? signedOut,
    TResult? Function(PasswordRecovery value)? passwordRecovery,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JUser value)? signedIn,
    TResult Function(SignedOut value)? signedOut,
    TResult Function(PasswordRecovery value)? passwordRecovery,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$JUserImplToJson(
      this,
    );
  }
}

abstract class JUser extends AppUser {
  const factory JUser(
      {required final String uid,
      required final String displayName,
      required final String email,
      required final String phone,
      final String token,
      final DateTime? lastSignIn,
      final UserProfileModel? userProfile}) = _$JUserImpl;
  const JUser._() : super._();

  factory JUser.fromJson(Map<String, dynamic> json) = _$JUserImpl.fromJson;

  String get uid;
  String get displayName;
  String get email;
  String get phone;
  String get token;
  DateTime? get lastSignIn;
  UserProfileModel? get userProfile;
  @JsonKey(ignore: true)
  _$$JUserImplCopyWith<_$JUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignedOutImplCopyWith<$Res> {
  factory _$$SignedOutImplCopyWith(
          _$SignedOutImpl value, $Res Function(_$SignedOutImpl) then) =
      __$$SignedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignedOutImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$SignedOutImpl>
    implements _$$SignedOutImplCopyWith<$Res> {
  __$$SignedOutImplCopyWithImpl(
      _$SignedOutImpl _value, $Res Function(_$SignedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SignedOutImpl extends SignedOut {
  const _$SignedOutImpl({final String? $type})
      : $type = $type ?? 'signedOut',
        super._();

  factory _$SignedOutImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignedOutImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.signedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignedOutImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uid,
            String displayName,
            String email,
            String phone,
            String token,
            DateTime? lastSignIn,
            UserProfileModel? userProfile)
        signedIn,
    required TResult Function() signedOut,
    required TResult Function() passwordRecovery,
  }) {
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uid,
            String displayName,
            String email,
            String phone,
            String token,
            DateTime? lastSignIn,
            UserProfileModel? userProfile)?
        signedIn,
    TResult? Function()? signedOut,
    TResult? Function()? passwordRecovery,
  }) {
    return signedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, String displayName, String email, String phone,
            String token, DateTime? lastSignIn, UserProfileModel? userProfile)?
        signedIn,
    TResult Function()? signedOut,
    TResult Function()? passwordRecovery,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JUser value) signedIn,
    required TResult Function(SignedOut value) signedOut,
    required TResult Function(PasswordRecovery value) passwordRecovery,
  }) {
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JUser value)? signedIn,
    TResult? Function(SignedOut value)? signedOut,
    TResult? Function(PasswordRecovery value)? passwordRecovery,
  }) {
    return signedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JUser value)? signedIn,
    TResult Function(SignedOut value)? signedOut,
    TResult Function(PasswordRecovery value)? passwordRecovery,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SignedOutImplToJson(
      this,
    );
  }
}

abstract class SignedOut extends AppUser {
  const factory SignedOut() = _$SignedOutImpl;
  const SignedOut._() : super._();

  factory SignedOut.fromJson(Map<String, dynamic> json) =
      _$SignedOutImpl.fromJson;
}

/// @nodoc
abstract class _$$PasswordRecoveryImplCopyWith<$Res> {
  factory _$$PasswordRecoveryImplCopyWith(_$PasswordRecoveryImpl value,
          $Res Function(_$PasswordRecoveryImpl) then) =
      __$$PasswordRecoveryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordRecoveryImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$PasswordRecoveryImpl>
    implements _$$PasswordRecoveryImplCopyWith<$Res> {
  __$$PasswordRecoveryImplCopyWithImpl(_$PasswordRecoveryImpl _value,
      $Res Function(_$PasswordRecoveryImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PasswordRecoveryImpl extends PasswordRecovery {
  const _$PasswordRecoveryImpl({final String? $type})
      : $type = $type ?? 'passwordRecovery',
        super._();

  factory _$PasswordRecoveryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordRecoveryImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppUser.passwordRecovery()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasswordRecoveryImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uid,
            String displayName,
            String email,
            String phone,
            String token,
            DateTime? lastSignIn,
            UserProfileModel? userProfile)
        signedIn,
    required TResult Function() signedOut,
    required TResult Function() passwordRecovery,
  }) {
    return passwordRecovery();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uid,
            String displayName,
            String email,
            String phone,
            String token,
            DateTime? lastSignIn,
            UserProfileModel? userProfile)?
        signedIn,
    TResult? Function()? signedOut,
    TResult? Function()? passwordRecovery,
  }) {
    return passwordRecovery?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, String displayName, String email, String phone,
            String token, DateTime? lastSignIn, UserProfileModel? userProfile)?
        signedIn,
    TResult Function()? signedOut,
    TResult Function()? passwordRecovery,
    required TResult orElse(),
  }) {
    if (passwordRecovery != null) {
      return passwordRecovery();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JUser value) signedIn,
    required TResult Function(SignedOut value) signedOut,
    required TResult Function(PasswordRecovery value) passwordRecovery,
  }) {
    return passwordRecovery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JUser value)? signedIn,
    TResult? Function(SignedOut value)? signedOut,
    TResult? Function(PasswordRecovery value)? passwordRecovery,
  }) {
    return passwordRecovery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JUser value)? signedIn,
    TResult Function(SignedOut value)? signedOut,
    TResult Function(PasswordRecovery value)? passwordRecovery,
    required TResult orElse(),
  }) {
    if (passwordRecovery != null) {
      return passwordRecovery(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordRecoveryImplToJson(
      this,
    );
  }
}

abstract class PasswordRecovery extends AppUser {
  const factory PasswordRecovery() = _$PasswordRecoveryImpl;
  const PasswordRecovery._() : super._();

  factory PasswordRecovery.fromJson(Map<String, dynamic> json) =
      _$PasswordRecoveryImpl.fromJson;
}
