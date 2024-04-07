// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileSettingsModel _$UserProfileSettingsModelFromJson(
    Map<String, dynamic> json) {
  return _UserProfileSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileSettingsModel {
  int get id => throw _privateConstructorUsedError;
  UserProfilePrivacySettingsModel? get privacySettings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileSettingsModelCopyWith<UserProfileSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileSettingsModelCopyWith<$Res> {
  factory $UserProfileSettingsModelCopyWith(UserProfileSettingsModel value,
          $Res Function(UserProfileSettingsModel) then) =
      _$UserProfileSettingsModelCopyWithImpl<$Res, UserProfileSettingsModel>;
  @useResult
  $Res call({int id, UserProfilePrivacySettingsModel? privacySettings});

  $UserProfilePrivacySettingsModelCopyWith<$Res>? get privacySettings;
}

/// @nodoc
class _$UserProfileSettingsModelCopyWithImpl<$Res,
        $Val extends UserProfileSettingsModel>
    implements $UserProfileSettingsModelCopyWith<$Res> {
  _$UserProfileSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? privacySettings = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      privacySettings: freezed == privacySettings
          ? _value.privacySettings
          : privacySettings // ignore: cast_nullable_to_non_nullable
              as UserProfilePrivacySettingsModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfilePrivacySettingsModelCopyWith<$Res>? get privacySettings {
    if (_value.privacySettings == null) {
      return null;
    }

    return $UserProfilePrivacySettingsModelCopyWith<$Res>(
        _value.privacySettings!, (value) {
      return _then(_value.copyWith(privacySettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileSettingsModelImplCopyWith<$Res>
    implements $UserProfileSettingsModelCopyWith<$Res> {
  factory _$$UserProfileSettingsModelImplCopyWith(
          _$UserProfileSettingsModelImpl value,
          $Res Function(_$UserProfileSettingsModelImpl) then) =
      __$$UserProfileSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, UserProfilePrivacySettingsModel? privacySettings});

  @override
  $UserProfilePrivacySettingsModelCopyWith<$Res>? get privacySettings;
}

/// @nodoc
class __$$UserProfileSettingsModelImplCopyWithImpl<$Res>
    extends _$UserProfileSettingsModelCopyWithImpl<$Res,
        _$UserProfileSettingsModelImpl>
    implements _$$UserProfileSettingsModelImplCopyWith<$Res> {
  __$$UserProfileSettingsModelImplCopyWithImpl(
      _$UserProfileSettingsModelImpl _value,
      $Res Function(_$UserProfileSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? privacySettings = freezed,
  }) {
    return _then(_$UserProfileSettingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      privacySettings: freezed == privacySettings
          ? _value.privacySettings
          : privacySettings // ignore: cast_nullable_to_non_nullable
              as UserProfilePrivacySettingsModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileSettingsModelImpl implements _UserProfileSettingsModel {
  const _$UserProfileSettingsModelImpl(
      {required this.id, this.privacySettings = null});

  factory _$UserProfileSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileSettingsModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final UserProfilePrivacySettingsModel? privacySettings;

  @override
  String toString() {
    return 'UserProfileSettingsModel(id: $id, privacySettings: $privacySettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileSettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.privacySettings, privacySettings) ||
                other.privacySettings == privacySettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, privacySettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileSettingsModelImplCopyWith<_$UserProfileSettingsModelImpl>
      get copyWith => __$$UserProfileSettingsModelImplCopyWithImpl<
          _$UserProfileSettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileSettingsModel implements UserProfileSettingsModel {
  const factory _UserProfileSettingsModel(
          {required final int id,
          final UserProfilePrivacySettingsModel? privacySettings}) =
      _$UserProfileSettingsModelImpl;

  factory _UserProfileSettingsModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileSettingsModelImpl.fromJson;

  @override
  int get id;
  @override
  UserProfilePrivacySettingsModel? get privacySettings;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileSettingsModelImplCopyWith<_$UserProfileSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
