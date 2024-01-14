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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LastMessageModel _$LastMessageModelFromJson(Map<String, dynamic> json) {
  return _LastMessageModel.fromJson(json);
}

/// @nodoc
mixin _$LastMessageModel {
  int get id => throw _privateConstructorUsedError;
  int get chatId => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  MessageType get messageType => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String? get messageText => throw _privateConstructorUsedError;
  MessageDeliveryStatus? get messageStatus =>
      throw _privateConstructorUsedError;
  String? get mediaContentUrl => throw _privateConstructorUsedError;

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
      {int id,
      int chatId,
      DateTime sentAt,
      MessageType messageType,
      String senderId,
      String? messageText,
      MessageDeliveryStatus? messageStatus,
      String? mediaContentUrl});
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
      {int id,
      int chatId,
      DateTime sentAt,
      MessageType messageType,
      String senderId,
      String? messageText,
      MessageDeliveryStatus? messageStatus,
      String? mediaContentUrl});
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
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$LastMessageModelImpl extends _LastMessageModel {
  const _$LastMessageModelImpl(
      {required this.id,
      required this.chatId,
      required this.sentAt,
      required this.messageType,
      required this.senderId,
      required this.messageText,
      this.messageStatus = MessageDeliveryStatus.sending,
      this.mediaContentUrl})
      : super._();

  factory _$LastMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastMessageModelImplFromJson(json);

  @override
  final int id;
  @override
  final int chatId;
  @override
  final DateTime sentAt;
  @override
  final MessageType messageType;
  @override
  final String senderId;
  @override
  final String? messageText;
  @override
  @JsonKey()
  final MessageDeliveryStatus? messageStatus;
  @override
  final String? mediaContentUrl;

  @override
  String toString() {
    return 'LastMessageModel(id: $id, chatId: $chatId, sentAt: $sentAt, messageType: $messageType, senderId: $senderId, messageText: $messageText, messageStatus: $messageStatus, mediaContentUrl: $mediaContentUrl)';
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
                other.mediaContentUrl == mediaContentUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, chatId, sentAt, messageType,
      senderId, messageText, messageStatus, mediaContentUrl);

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
      {required final int id,
      required final int chatId,
      required final DateTime sentAt,
      required final MessageType messageType,
      required final String senderId,
      required final String? messageText,
      final MessageDeliveryStatus? messageStatus,
      final String? mediaContentUrl}) = _$LastMessageModelImpl;
  const _LastMessageModel._() : super._();

  factory _LastMessageModel.fromJson(Map<String, dynamic> json) =
      _$LastMessageModelImpl.fromJson;

  @override
  int get id;
  @override
  int get chatId;
  @override
  DateTime get sentAt;
  @override
  MessageType get messageType;
  @override
  String get senderId;
  @override
  String? get messageText;
  @override
  MessageDeliveryStatus? get messageStatus;
  @override
  String? get mediaContentUrl;
  @override
  @JsonKey(ignore: true)
  _$$LastMessageModelImplCopyWith<_$LastMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
