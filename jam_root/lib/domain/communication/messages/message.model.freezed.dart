// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  @JsonKey(includeIfNull: false)
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get chatId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get mediaContentUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get sentAt => throw _privateConstructorUsedError;
  @HiveField(4)
  MessageType get messageType => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(includeToJson: false)
  String? get senderId => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get repliedTo => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime? get editedAt => throw _privateConstructorUsedError;
  @HiveField(8)
  ForwardedFromModel? get forwardedFrom => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get messageText => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(includeToJson: false)
  String? get senderName => throw _privateConstructorUsedError;
  @HiveField(11)
  MessagePinState get pinnedState => throw _privateConstructorUsedError;
  MessageDeliveryStatus? get messageStatus =>
      throw _privateConstructorUsedError;
  @HiveField(13)
  bool get fromMe => throw _privateConstructorUsedError;

  ///
  /// extra field for queue in case we try to reply
  /// to a message that is not yet sent and we don't have the id
  ///
  @JsonKey(includeFromJson: false, includeToJson: false, includeIfNull: false)
  DateTime? get repliedToDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) @HiveField(0) int? id,
      @HiveField(1) int? chatId,
      @HiveField(2) String? mediaContentUrl,
      @HiveField(3) DateTime sentAt,
      @HiveField(4) MessageType messageType,
      @HiveField(5) @JsonKey(includeToJson: false) String? senderId,
      @HiveField(6) int? repliedTo,
      @HiveField(7) DateTime? editedAt,
      @HiveField(8) ForwardedFromModel? forwardedFrom,
      @HiveField(9) String? messageText,
      @HiveField(10) @JsonKey(includeToJson: false) String? senderName,
      @HiveField(11) MessagePinState pinnedState,
      MessageDeliveryStatus? messageStatus,
      @HiveField(13) bool fromMe,
      @JsonKey(
          includeFromJson: false, includeToJson: false, includeIfNull: false)
      DateTime? repliedToDate});

  $ForwardedFromModelCopyWith<$Res>? get forwardedFrom;
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatId = freezed,
    Object? mediaContentUrl = freezed,
    Object? sentAt = null,
    Object? messageType = null,
    Object? senderId = freezed,
    Object? repliedTo = freezed,
    Object? editedAt = freezed,
    Object? forwardedFrom = freezed,
    Object? messageText = freezed,
    Object? senderName = freezed,
    Object? pinnedState = null,
    Object? messageStatus = freezed,
    Object? fromMe = null,
    Object? repliedToDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaContentUrl: freezed == mediaContentUrl
          ? _value.mediaContentUrl
          : mediaContentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedTo: freezed == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      editedAt: freezed == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      forwardedFrom: freezed == forwardedFrom
          ? _value.forwardedFrom
          : forwardedFrom // ignore: cast_nullable_to_non_nullable
              as ForwardedFromModel?,
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      pinnedState: null == pinnedState
          ? _value.pinnedState
          : pinnedState // ignore: cast_nullable_to_non_nullable
              as MessagePinState,
      messageStatus: freezed == messageStatus
          ? _value.messageStatus
          : messageStatus // ignore: cast_nullable_to_non_nullable
              as MessageDeliveryStatus?,
      fromMe: null == fromMe
          ? _value.fromMe
          : fromMe // ignore: cast_nullable_to_non_nullable
              as bool,
      repliedToDate: freezed == repliedToDate
          ? _value.repliedToDate
          : repliedToDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ForwardedFromModelCopyWith<$Res>? get forwardedFrom {
    if (_value.forwardedFrom == null) {
      return null;
    }

    return $ForwardedFromModelCopyWith<$Res>(_value.forwardedFrom!, (value) {
      return _then(_value.copyWith(forwardedFrom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
          _$MessageModelImpl value, $Res Function(_$MessageModelImpl) then) =
      __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) @HiveField(0) int? id,
      @HiveField(1) int? chatId,
      @HiveField(2) String? mediaContentUrl,
      @HiveField(3) DateTime sentAt,
      @HiveField(4) MessageType messageType,
      @HiveField(5) @JsonKey(includeToJson: false) String? senderId,
      @HiveField(6) int? repliedTo,
      @HiveField(7) DateTime? editedAt,
      @HiveField(8) ForwardedFromModel? forwardedFrom,
      @HiveField(9) String? messageText,
      @HiveField(10) @JsonKey(includeToJson: false) String? senderName,
      @HiveField(11) MessagePinState pinnedState,
      MessageDeliveryStatus? messageStatus,
      @HiveField(13) bool fromMe,
      @JsonKey(
          includeFromJson: false, includeToJson: false, includeIfNull: false)
      DateTime? repliedToDate});

  @override
  $ForwardedFromModelCopyWith<$Res>? get forwardedFrom;
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
      _$MessageModelImpl _value, $Res Function(_$MessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatId = freezed,
    Object? mediaContentUrl = freezed,
    Object? sentAt = null,
    Object? messageType = null,
    Object? senderId = freezed,
    Object? repliedTo = freezed,
    Object? editedAt = freezed,
    Object? forwardedFrom = freezed,
    Object? messageText = freezed,
    Object? senderName = freezed,
    Object? pinnedState = null,
    Object? messageStatus = freezed,
    Object? fromMe = null,
    Object? repliedToDate = freezed,
  }) {
    return _then(_$MessageModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaContentUrl: freezed == mediaContentUrl
          ? _value.mediaContentUrl
          : mediaContentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedTo: freezed == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as int?,
      editedAt: freezed == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      forwardedFrom: freezed == forwardedFrom
          ? _value.forwardedFrom
          : forwardedFrom // ignore: cast_nullable_to_non_nullable
              as ForwardedFromModel?,
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      pinnedState: null == pinnedState
          ? _value.pinnedState
          : pinnedState // ignore: cast_nullable_to_non_nullable
              as MessagePinState,
      messageStatus: freezed == messageStatus
          ? _value.messageStatus
          : messageStatus // ignore: cast_nullable_to_non_nullable
              as MessageDeliveryStatus?,
      fromMe: null == fromMe
          ? _value.fromMe
          : fromMe // ignore: cast_nullable_to_non_nullable
              as bool,
      repliedToDate: freezed == repliedToDate
          ? _value.repliedToDate
          : repliedToDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 8, adapterName: 'DefaultMessageModelAdapter')
class _$MessageModelImpl extends _MessageModel {
  const _$MessageModelImpl(
      {@JsonKey(includeIfNull: false) @HiveField(0) this.id,
      @HiveField(1) this.chatId,
      @HiveField(2) this.mediaContentUrl,
      @HiveField(3) required this.sentAt,
      @HiveField(4) this.messageType = MessageType.text,
      @HiveField(5) @JsonKey(includeToJson: false) this.senderId,
      @HiveField(6) this.repliedTo,
      @HiveField(7) this.editedAt,
      @HiveField(8) this.forwardedFrom,
      @HiveField(9) this.messageText,
      @HiveField(10) @JsonKey(includeToJson: false) this.senderName,
      @HiveField(11) this.pinnedState = MessagePinState.no_one,
      this.messageStatus = MessageDeliveryStatus.sending,
      @HiveField(13) required this.fromMe,
      @JsonKey(
          includeFromJson: false, includeToJson: false, includeIfNull: false)
      this.repliedToDate})
      : super._();

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final int? chatId;
  @override
  @HiveField(2)
  final String? mediaContentUrl;
  @override
  @HiveField(3)
  final DateTime sentAt;
  @override
  @JsonKey()
  @HiveField(4)
  final MessageType messageType;
  @override
  @HiveField(5)
  @JsonKey(includeToJson: false)
  final String? senderId;
  @override
  @HiveField(6)
  final int? repliedTo;
  @override
  @HiveField(7)
  final DateTime? editedAt;
  @override
  @HiveField(8)
  final ForwardedFromModel? forwardedFrom;
  @override
  @HiveField(9)
  final String? messageText;
  @override
  @HiveField(10)
  @JsonKey(includeToJson: false)
  final String? senderName;
  @override
  @JsonKey()
  @HiveField(11)
  final MessagePinState pinnedState;
  @override
  @JsonKey()
  final MessageDeliveryStatus? messageStatus;
  @override
  @HiveField(13)
  final bool fromMe;

  ///
  /// extra field for queue in case we try to reply
  /// to a message that is not yet sent and we don't have the id
  ///
  @override
  @JsonKey(includeFromJson: false, includeToJson: false, includeIfNull: false)
  final DateTime? repliedToDate;

  @override
  String toString() {
    return 'MessageModel(id: $id, chatId: $chatId, mediaContentUrl: $mediaContentUrl, sentAt: $sentAt, messageType: $messageType, senderId: $senderId, repliedTo: $repliedTo, editedAt: $editedAt, forwardedFrom: $forwardedFrom, messageText: $messageText, senderName: $senderName, pinnedState: $pinnedState, messageStatus: $messageStatus, fromMe: $fromMe, repliedToDate: $repliedToDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.mediaContentUrl, mediaContentUrl) ||
                other.mediaContentUrl == mediaContentUrl) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.repliedTo, repliedTo) ||
                other.repliedTo == repliedTo) &&
            (identical(other.editedAt, editedAt) ||
                other.editedAt == editedAt) &&
            (identical(other.forwardedFrom, forwardedFrom) ||
                other.forwardedFrom == forwardedFrom) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.pinnedState, pinnedState) ||
                other.pinnedState == pinnedState) &&
            (identical(other.messageStatus, messageStatus) ||
                other.messageStatus == messageStatus) &&
            (identical(other.fromMe, fromMe) || other.fromMe == fromMe) &&
            (identical(other.repliedToDate, repliedToDate) ||
                other.repliedToDate == repliedToDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      chatId,
      mediaContentUrl,
      sentAt,
      messageType,
      senderId,
      repliedTo,
      editedAt,
      forwardedFrom,
      messageText,
      senderName,
      pinnedState,
      messageStatus,
      fromMe,
      repliedToDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(
      this,
    );
  }
}

abstract class _MessageModel extends MessageModel {
  const factory _MessageModel(
      {@JsonKey(includeIfNull: false) @HiveField(0) final int? id,
      @HiveField(1) final int? chatId,
      @HiveField(2) final String? mediaContentUrl,
      @HiveField(3) required final DateTime sentAt,
      @HiveField(4) final MessageType messageType,
      @HiveField(5) @JsonKey(includeToJson: false) final String? senderId,
      @HiveField(6) final int? repliedTo,
      @HiveField(7) final DateTime? editedAt,
      @HiveField(8) final ForwardedFromModel? forwardedFrom,
      @HiveField(9) final String? messageText,
      @HiveField(10) @JsonKey(includeToJson: false) final String? senderName,
      @HiveField(11) final MessagePinState pinnedState,
      final MessageDeliveryStatus? messageStatus,
      @HiveField(13) required final bool fromMe,
      @JsonKey(
          includeFromJson: false, includeToJson: false, includeIfNull: false)
      final DateTime? repliedToDate}) = _$MessageModelImpl;
  const _MessageModel._() : super._();

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  int? get chatId;
  @override
  @HiveField(2)
  String? get mediaContentUrl;
  @override
  @HiveField(3)
  DateTime get sentAt;
  @override
  @HiveField(4)
  MessageType get messageType;
  @override
  @HiveField(5)
  @JsonKey(includeToJson: false)
  String? get senderId;
  @override
  @HiveField(6)
  int? get repliedTo;
  @override
  @HiveField(7)
  DateTime? get editedAt;
  @override
  @HiveField(8)
  ForwardedFromModel? get forwardedFrom;
  @override
  @HiveField(9)
  String? get messageText;
  @override
  @HiveField(10)
  @JsonKey(includeToJson: false)
  String? get senderName;
  @override
  @HiveField(11)
  MessagePinState get pinnedState;
  @override
  MessageDeliveryStatus? get messageStatus;
  @override
  @HiveField(13)
  bool get fromMe;
  @override

  ///
  /// extra field for queue in case we try to reply
  /// to a message that is not yet sent and we don't have the id
  ///
  @JsonKey(includeFromJson: false, includeToJson: false, includeIfNull: false)
  DateTime? get repliedToDate;
  @override
  @JsonKey(ignore: true)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
