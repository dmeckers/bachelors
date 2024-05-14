// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jam_invite.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JamInviteModel _$JamInviteModelFromJson(Map<String, dynamic> json) {
  return _JamInviteModel.fromJson(json);
}

/// @nodoc
mixin _$JamInviteModel {
  int get id => throw _privateConstructorUsedError;
  int get jamId => throw _privateConstructorUsedError;
  String get invitedUserId => throw _privateConstructorUsedError;
  String get sendedFromUserId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String get status => throw _privateConstructorUsedError;
  DateTime get insertedAt => throw _privateConstructorUsedError;
  UserProfileModel get sender => throw _privateConstructorUsedError;
  @JsonKey(readValue: _JamInviteJsonTransformer.readJamName)
  String get jamName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JamInviteModelCopyWith<JamInviteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JamInviteModelCopyWith<$Res> {
  factory $JamInviteModelCopyWith(
          JamInviteModel value, $Res Function(JamInviteModel) then) =
      _$JamInviteModelCopyWithImpl<$Res, JamInviteModel>;
  @useResult
  $Res call(
      {int id,
      int jamId,
      String invitedUserId,
      String sendedFromUserId,
      @JsonKey(includeIfNull: false) String status,
      DateTime insertedAt,
      UserProfileModel sender,
      @JsonKey(readValue: _JamInviteJsonTransformer.readJamName)
      String jamName});

  $UserProfileModelCopyWith<$Res> get sender;
}

/// @nodoc
class _$JamInviteModelCopyWithImpl<$Res, $Val extends JamInviteModel>
    implements $JamInviteModelCopyWith<$Res> {
  _$JamInviteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jamId = null,
    Object? invitedUserId = null,
    Object? sendedFromUserId = null,
    Object? status = null,
    Object? insertedAt = null,
    Object? sender = null,
    Object? jamName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      jamId: null == jamId
          ? _value.jamId
          : jamId // ignore: cast_nullable_to_non_nullable
              as int,
      invitedUserId: null == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      sendedFromUserId: null == sendedFromUserId
          ? _value.sendedFromUserId
          : sendedFromUserId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      insertedAt: null == insertedAt
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      jamName: null == jamName
          ? _value.jamName
          : jamName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res> get sender {
    return $UserProfileModelCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JamInviteModelImplCopyWith<$Res>
    implements $JamInviteModelCopyWith<$Res> {
  factory _$$JamInviteModelImplCopyWith(_$JamInviteModelImpl value,
          $Res Function(_$JamInviteModelImpl) then) =
      __$$JamInviteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int jamId,
      String invitedUserId,
      String sendedFromUserId,
      @JsonKey(includeIfNull: false) String status,
      DateTime insertedAt,
      UserProfileModel sender,
      @JsonKey(readValue: _JamInviteJsonTransformer.readJamName)
      String jamName});

  @override
  $UserProfileModelCopyWith<$Res> get sender;
}

/// @nodoc
class __$$JamInviteModelImplCopyWithImpl<$Res>
    extends _$JamInviteModelCopyWithImpl<$Res, _$JamInviteModelImpl>
    implements _$$JamInviteModelImplCopyWith<$Res> {
  __$$JamInviteModelImplCopyWithImpl(
      _$JamInviteModelImpl _value, $Res Function(_$JamInviteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jamId = null,
    Object? invitedUserId = null,
    Object? sendedFromUserId = null,
    Object? status = null,
    Object? insertedAt = null,
    Object? sender = null,
    Object? jamName = null,
  }) {
    return _then(_$JamInviteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      jamId: null == jamId
          ? _value.jamId
          : jamId // ignore: cast_nullable_to_non_nullable
              as int,
      invitedUserId: null == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String,
      sendedFromUserId: null == sendedFromUserId
          ? _value.sendedFromUserId
          : sendedFromUserId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      insertedAt: null == insertedAt
          ? _value.insertedAt
          : insertedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      jamName: null == jamName
          ? _value.jamName
          : jamName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$JamInviteModelImpl extends _JamInviteModel {
  const _$JamInviteModelImpl(
      {required this.id,
      required this.jamId,
      required this.invitedUserId,
      required this.sendedFromUserId,
      @JsonKey(includeIfNull: false) required this.status,
      required this.insertedAt,
      required this.sender,
      @JsonKey(readValue: _JamInviteJsonTransformer.readJamName)
      required this.jamName})
      : super._();

  factory _$JamInviteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamInviteModelImplFromJson(json);

  @override
  final int id;
  @override
  final int jamId;
  @override
  final String invitedUserId;
  @override
  final String sendedFromUserId;
  @override
  @JsonKey(includeIfNull: false)
  final String status;
  @override
  final DateTime insertedAt;
  @override
  final UserProfileModel sender;
  @override
  @JsonKey(readValue: _JamInviteJsonTransformer.readJamName)
  final String jamName;

  @override
  String toString() {
    return 'JamInviteModel(id: $id, jamId: $jamId, invitedUserId: $invitedUserId, sendedFromUserId: $sendedFromUserId, status: $status, insertedAt: $insertedAt, sender: $sender, jamName: $jamName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamInviteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jamId, jamId) || other.jamId == jamId) &&
            (identical(other.invitedUserId, invitedUserId) ||
                other.invitedUserId == invitedUserId) &&
            (identical(other.sendedFromUserId, sendedFromUserId) ||
                other.sendedFromUserId == sendedFromUserId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.insertedAt, insertedAt) ||
                other.insertedAt == insertedAt) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.jamName, jamName) || other.jamName == jamName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, jamId, invitedUserId,
      sendedFromUserId, status, insertedAt, sender, jamName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JamInviteModelImplCopyWith<_$JamInviteModelImpl> get copyWith =>
      __$$JamInviteModelImplCopyWithImpl<_$JamInviteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JamInviteModelImplToJson(
      this,
    );
  }
}

abstract class _JamInviteModel extends JamInviteModel {
  const factory _JamInviteModel(
      {required final int id,
      required final int jamId,
      required final String invitedUserId,
      required final String sendedFromUserId,
      @JsonKey(includeIfNull: false) required final String status,
      required final DateTime insertedAt,
      required final UserProfileModel sender,
      @JsonKey(readValue: _JamInviteJsonTransformer.readJamName)
      required final String jamName}) = _$JamInviteModelImpl;
  const _JamInviteModel._() : super._();

  factory _JamInviteModel.fromJson(Map<String, dynamic> json) =
      _$JamInviteModelImpl.fromJson;

  @override
  int get id;
  @override
  int get jamId;
  @override
  String get invitedUserId;
  @override
  String get sendedFromUserId;
  @override
  @JsonKey(includeIfNull: false)
  String get status;
  @override
  DateTime get insertedAt;
  @override
  UserProfileModel get sender;
  @override
  @JsonKey(readValue: _JamInviteJsonTransformer.readJamName)
  String get jamName;
  @override
  @JsonKey(ignore: true)
  _$$JamInviteModelImplCopyWith<_$JamInviteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
