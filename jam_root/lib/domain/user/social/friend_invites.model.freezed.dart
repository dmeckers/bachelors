// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_invites.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendInviteModel _$FriendInviteModelFromJson(Map<String, dynamic> json) {
  return _FriendInviteModel.fromJson(json);
}

/// @nodoc
mixin _$FriendInviteModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get userReceived => throw _privateConstructorUsedError;
  @HiveField(6)
  String get userSent => throw _privateConstructorUsedError;
  @HiveField(2)
  String get fullName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get avatar => throw _privateConstructorUsedError;
  @HiveField(4)
  String get status => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get sentAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendInviteModelCopyWith<FriendInviteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendInviteModelCopyWith<$Res> {
  factory $FriendInviteModelCopyWith(
          FriendInviteModel value, $Res Function(FriendInviteModel) then) =
      _$FriendInviteModelCopyWithImpl<$Res, FriendInviteModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String userReceived,
      @HiveField(6) String userSent,
      @HiveField(2) String fullName,
      @HiveField(3) String? avatar,
      @HiveField(4) String status,
      @HiveField(5) DateTime sentAt});
}

/// @nodoc
class _$FriendInviteModelCopyWithImpl<$Res, $Val extends FriendInviteModel>
    implements $FriendInviteModelCopyWith<$Res> {
  _$FriendInviteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userReceived = null,
    Object? userSent = null,
    Object? fullName = null,
    Object? avatar = freezed,
    Object? status = null,
    Object? sentAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userReceived: null == userReceived
          ? _value.userReceived
          : userReceived // ignore: cast_nullable_to_non_nullable
              as String,
      userSent: null == userSent
          ? _value.userSent
          : userSent // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendInviteModelImplCopyWith<$Res>
    implements $FriendInviteModelCopyWith<$Res> {
  factory _$$FriendInviteModelImplCopyWith(_$FriendInviteModelImpl value,
          $Res Function(_$FriendInviteModelImpl) then) =
      __$$FriendInviteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String userReceived,
      @HiveField(6) String userSent,
      @HiveField(2) String fullName,
      @HiveField(3) String? avatar,
      @HiveField(4) String status,
      @HiveField(5) DateTime sentAt});
}

/// @nodoc
class __$$FriendInviteModelImplCopyWithImpl<$Res>
    extends _$FriendInviteModelCopyWithImpl<$Res, _$FriendInviteModelImpl>
    implements _$$FriendInviteModelImplCopyWith<$Res> {
  __$$FriendInviteModelImplCopyWithImpl(_$FriendInviteModelImpl _value,
      $Res Function(_$FriendInviteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userReceived = null,
    Object? userSent = null,
    Object? fullName = null,
    Object? avatar = freezed,
    Object? status = null,
    Object? sentAt = null,
  }) {
    return _then(_$FriendInviteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userReceived: null == userReceived
          ? _value.userReceived
          : userReceived // ignore: cast_nullable_to_non_nullable
              as String,
      userSent: null == userSent
          ? _value.userSent
          : userSent // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 3, adapterName: 'FriendInviteModelAdapter')
class _$FriendInviteModelImpl extends _FriendInviteModel {
  const _$FriendInviteModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.userReceived,
      @HiveField(6) required this.userSent,
      @HiveField(2) required this.fullName,
      @HiveField(3) this.avatar,
      @HiveField(4) required this.status,
      @HiveField(5) required this.sentAt})
      : super._();

  factory _$FriendInviteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendInviteModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String userReceived;
  @override
  @HiveField(6)
  final String userSent;
  @override
  @HiveField(2)
  final String fullName;
  @override
  @HiveField(3)
  final String? avatar;
  @override
  @HiveField(4)
  final String status;
  @override
  @HiveField(5)
  final DateTime sentAt;

  @override
  String toString() {
    return 'FriendInviteModel(id: $id, userReceived: $userReceived, userSent: $userSent, fullName: $fullName, avatar: $avatar, status: $status, sentAt: $sentAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendInviteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userReceived, userReceived) ||
                other.userReceived == userReceived) &&
            (identical(other.userSent, userSent) ||
                other.userSent == userSent) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userReceived, userSent,
      fullName, avatar, status, sentAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendInviteModelImplCopyWith<_$FriendInviteModelImpl> get copyWith =>
      __$$FriendInviteModelImplCopyWithImpl<_$FriendInviteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendInviteModelImplToJson(
      this,
    );
  }
}

abstract class _FriendInviteModel extends FriendInviteModel {
  const factory _FriendInviteModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String userReceived,
      @HiveField(6) required final String userSent,
      @HiveField(2) required final String fullName,
      @HiveField(3) final String? avatar,
      @HiveField(4) required final String status,
      @HiveField(5) required final DateTime sentAt}) = _$FriendInviteModelImpl;
  const _FriendInviteModel._() : super._();

  factory _FriendInviteModel.fromJson(Map<String, dynamic> json) =
      _$FriendInviteModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get userReceived;
  @override
  @HiveField(6)
  String get userSent;
  @override
  @HiveField(2)
  String get fullName;
  @override
  @HiveField(3)
  String? get avatar;
  @override
  @HiveField(4)
  String get status;
  @override
  @HiveField(5)
  DateTime get sentAt;
  @override
  @JsonKey(ignore: true)
  _$$FriendInviteModelImplCopyWith<_$FriendInviteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
