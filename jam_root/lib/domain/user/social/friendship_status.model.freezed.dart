// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friendship_status.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendShipStatusModel _$FriendShipStatusModelFromJson(
    Map<String, dynamic> json) {
  return _FriendShipStatusModel.fromJson(json);
}

/// @nodoc
mixin _$FriendShipStatusModel {
  RelationshipStatus get status => throw _privateConstructorUsedError;
  UserProfileModel get profile => throw _privateConstructorUsedError;
  int? get receivedFriendRequestId => throw _privateConstructorUsedError;
  int? get sentFriendRequestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendShipStatusModelCopyWith<FriendShipStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendShipStatusModelCopyWith<$Res> {
  factory $FriendShipStatusModelCopyWith(FriendShipStatusModel value,
          $Res Function(FriendShipStatusModel) then) =
      _$FriendShipStatusModelCopyWithImpl<$Res, FriendShipStatusModel>;
  @useResult
  $Res call(
      {RelationshipStatus status,
      UserProfileModel profile,
      int? receivedFriendRequestId,
      int? sentFriendRequestId});

  $UserProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class _$FriendShipStatusModelCopyWithImpl<$Res,
        $Val extends FriendShipStatusModel>
    implements $FriendShipStatusModelCopyWith<$Res> {
  _$FriendShipStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? profile = null,
    Object? receivedFriendRequestId = freezed,
    Object? sentFriendRequestId = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RelationshipStatus,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      receivedFriendRequestId: freezed == receivedFriendRequestId
          ? _value.receivedFriendRequestId
          : receivedFriendRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      sentFriendRequestId: freezed == sentFriendRequestId
          ? _value.sentFriendRequestId
          : sentFriendRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res> get profile {
    return $UserProfileModelCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FriendShipStatusModelImplCopyWith<$Res>
    implements $FriendShipStatusModelCopyWith<$Res> {
  factory _$$FriendShipStatusModelImplCopyWith(
          _$FriendShipStatusModelImpl value,
          $Res Function(_$FriendShipStatusModelImpl) then) =
      __$$FriendShipStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RelationshipStatus status,
      UserProfileModel profile,
      int? receivedFriendRequestId,
      int? sentFriendRequestId});

  @override
  $UserProfileModelCopyWith<$Res> get profile;
}

/// @nodoc
class __$$FriendShipStatusModelImplCopyWithImpl<$Res>
    extends _$FriendShipStatusModelCopyWithImpl<$Res,
        _$FriendShipStatusModelImpl>
    implements _$$FriendShipStatusModelImplCopyWith<$Res> {
  __$$FriendShipStatusModelImplCopyWithImpl(_$FriendShipStatusModelImpl _value,
      $Res Function(_$FriendShipStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? profile = null,
    Object? receivedFriendRequestId = freezed,
    Object? sentFriendRequestId = freezed,
  }) {
    return _then(_$FriendShipStatusModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RelationshipStatus,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      receivedFriendRequestId: freezed == receivedFriendRequestId
          ? _value.receivedFriendRequestId
          : receivedFriendRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      sentFriendRequestId: freezed == sentFriendRequestId
          ? _value.sentFriendRequestId
          : sentFriendRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FriendShipStatusModelImpl extends _FriendShipStatusModel {
  const _$FriendShipStatusModelImpl(
      {required this.status,
      required this.profile,
      required this.receivedFriendRequestId,
      required this.sentFriendRequestId})
      : super._();

  factory _$FriendShipStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendShipStatusModelImplFromJson(json);

  @override
  final RelationshipStatus status;
  @override
  final UserProfileModel profile;
  @override
  final int? receivedFriendRequestId;
  @override
  final int? sentFriendRequestId;

  @override
  String toString() {
    return 'FriendShipStatusModel(status: $status, profile: $profile, receivedFriendRequestId: $receivedFriendRequestId, sentFriendRequestId: $sentFriendRequestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendShipStatusModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(
                    other.receivedFriendRequestId, receivedFriendRequestId) ||
                other.receivedFriendRequestId == receivedFriendRequestId) &&
            (identical(other.sentFriendRequestId, sentFriendRequestId) ||
                other.sentFriendRequestId == sentFriendRequestId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, profile,
      receivedFriendRequestId, sentFriendRequestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendShipStatusModelImplCopyWith<_$FriendShipStatusModelImpl>
      get copyWith => __$$FriendShipStatusModelImplCopyWithImpl<
          _$FriendShipStatusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendShipStatusModelImplToJson(
      this,
    );
  }
}

abstract class _FriendShipStatusModel extends FriendShipStatusModel {
  const factory _FriendShipStatusModel(
      {required final RelationshipStatus status,
      required final UserProfileModel profile,
      required final int? receivedFriendRequestId,
      required final int? sentFriendRequestId}) = _$FriendShipStatusModelImpl;
  const _FriendShipStatusModel._() : super._();

  factory _FriendShipStatusModel.fromJson(Map<String, dynamic> json) =
      _$FriendShipStatusModelImpl.fromJson;

  @override
  RelationshipStatus get status;
  @override
  UserProfileModel get profile;
  @override
  int? get receivedFriendRequestId;
  @override
  int? get sentFriendRequestId;
  @override
  @JsonKey(ignore: true)
  _$$FriendShipStatusModelImplCopyWith<_$FriendShipStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
