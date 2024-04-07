// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_chat_message.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LastMessageModel _$LastMessageModelFromJson(Map<String, dynamic> json) {
  return _LastMessageModel.fromJson(json);
}

/// @nodoc
mixin _$LastMessageModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get chatId => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get sentAt => throw _privateConstructorUsedError;
  @HiveField(3)
  MessageType get messageType => throw _privateConstructorUsedError;
  @HiveField(4)
  String get senderId => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get messageText => throw _privateConstructorUsedError;
  @HiveField(6)
  MessageDeliveryStatus? get messageStatus =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  String? get mediaContentUrl => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get fromMe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastMessageModelCopyWith<LastMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastMessageModelCopyWith<$Res> {
  factory $LastMessageModelCopyWith(
          LastMessageModel value, $Res Function(LastMessageModel) then) =
      _$LastMessageModelCopyWithImpl<$Res, LastMessageModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int chatId,
      @HiveField(2) DateTime sentAt,
      @HiveField(3) MessageType messageType,
      @HiveField(4) String senderId,
      @HiveField(5) String? messageText,
      @HiveField(6) MessageDeliveryStatus? messageStatus,
      @HiveField(7) String? mediaContentUrl,
      @HiveField(8) bool fromMe});
}

/// @nodoc
class _$LastMessageModelCopyWithImpl<$Res, $Val extends LastMessageModel>
    implements $LastMessageModelCopyWith<$Res> {
  _$LastMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chatId = null,
    Object? sentAt = null,
    Object? messageType = null,
    Object? senderId = null,
    Object? messageText = freezed,
    Object? messageStatus = freezed,
    Object? mediaContentUrl = freezed,
    Object? fromMe = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String?,
      messageStatus: freezed == messageStatus
          ? _value.messageStatus
          : messageStatus // ignore: cast_nullable_to_non_nullable
              as MessageDeliveryStatus?,
      mediaContentUrl: freezed == mediaContentUrl
          ? _value.mediaContentUrl
          : mediaContentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fromMe: null == fromMe
          ? _value.fromMe
          : fromMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastMessageModelImplCopyWith<$Res>
    implements $LastMessageModelCopyWith<$Res> {
  factory _$$LastMessageModelImplCopyWith(_$LastMessageModelImpl value,
          $Res Function(_$LastMessageModelImpl) then) =
      __$$LastMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int chatId,
      @HiveField(2) DateTime sentAt,
      @HiveField(3) MessageType messageType,
      @HiveField(4) String senderId,
      @HiveField(5) String? messageText,
      @HiveField(6) MessageDeliveryStatus? messageStatus,
      @HiveField(7) String? mediaContentUrl,
      @HiveField(8) bool fromMe});
}

/// @nodoc
class __$$LastMessageModelImplCopyWithImpl<$Res>
    extends _$LastMessageModelCopyWithImpl<$Res, _$LastMessageModelImpl>
    implements _$$LastMessageModelImplCopyWith<$Res> {
  __$$LastMessageModelImplCopyWithImpl(_$LastMessageModelImpl _value,
      $Res Function(_$LastMessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chatId = null,
    Object? sentAt = null,
    Object? messageType = null,
    Object? senderId = null,
    Object? messageText = freezed,
    Object? messageStatus = freezed,
    Object? mediaContentUrl = freezed,
    Object? fromMe = null,
  }) {
    return _then(_$LastMessageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String?,
      messageStatus: freezed == messageStatus
          ? _value.messageStatus
          : messageStatus // ignore: cast_nullable_to_non_nullable
              as MessageDeliveryStatus?,
      mediaContentUrl: freezed == mediaContentUrl
          ? _value.mediaContentUrl
          : mediaContentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fromMe: null == fromMe
          ? _value.fromMe
          : fromMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 63, adapterName: 'LastMessageModelAdapter')
class _$LastMessageModelImpl extends _LastMessageModel {
  const _$LastMessageModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.chatId,
      @HiveField(2) required this.sentAt,
      @HiveField(3) required this.messageType,
      @HiveField(4) required this.senderId,
      @HiveField(5) required this.messageText,
      @HiveField(6) this.messageStatus = MessageDeliveryStatus.sending,
      @HiveField(7) this.mediaContentUrl,
      @HiveField(8) required this.fromMe})
      : super._();

  factory _$LastMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastMessageModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final int chatId;
  @override
  @HiveField(2)
  final DateTime sentAt;
  @override
  @HiveField(3)
  final MessageType messageType;
  @override
  @HiveField(4)
  final String senderId;
  @override
  @HiveField(5)
  final String? messageText;
  @override
  @JsonKey()
  @HiveField(6)
  final MessageDeliveryStatus? messageStatus;
  @override
  @HiveField(7)
  final String? mediaContentUrl;
  @override
  @HiveField(8)
  final bool fromMe;

  @override
  String toString() {
    return 'LastMessageModel(id: $id, chatId: $chatId, sentAt: $sentAt, messageType: $messageType, senderId: $senderId, messageText: $messageText, messageStatus: $messageStatus, mediaContentUrl: $mediaContentUrl, fromMe: $fromMe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastMessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(other.messageStatus, messageStatus) ||
                other.messageStatus == messageStatus) &&
            (identical(other.mediaContentUrl, mediaContentUrl) ||
                other.mediaContentUrl == mediaContentUrl) &&
            (identical(other.fromMe, fromMe) || other.fromMe == fromMe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, chatId, sentAt, messageType,
      senderId, messageText, messageStatus, mediaContentUrl, fromMe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastMessageModelImplCopyWith<_$LastMessageModelImpl> get copyWith =>
      __$$LastMessageModelImplCopyWithImpl<_$LastMessageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LastMessageModelImplToJson(
      this,
    );
  }
}

abstract class _LastMessageModel extends LastMessageModel {
  const factory _LastMessageModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final int chatId,
      @HiveField(2) required final DateTime sentAt,
      @HiveField(3) required final MessageType messageType,
      @HiveField(4) required final String senderId,
      @HiveField(5) required final String? messageText,
      @HiveField(6) final MessageDeliveryStatus? messageStatus,
      @HiveField(7) final String? mediaContentUrl,
      @HiveField(8) required final bool fromMe}) = _$LastMessageModelImpl;
  const _LastMessageModel._() : super._();

  factory _LastMessageModel.fromJson(Map<String, dynamic> json) =
      _$LastMessageModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  int get chatId;
  @override
  @HiveField(2)
  DateTime get sentAt;
  @override
  @HiveField(3)
  MessageType get messageType;
  @override
  @HiveField(4)
  String get senderId;
  @override
  @HiveField(5)
  String? get messageText;
  @override
  @HiveField(6)
  MessageDeliveryStatus? get messageStatus;
  @override
  @HiveField(7)
  String? get mediaContentUrl;
  @override
  @HiveField(8)
  bool get fromMe;
  @override
  @JsonKey(ignore: true)
  _$$LastMessageModelImplCopyWith<_$LastMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
