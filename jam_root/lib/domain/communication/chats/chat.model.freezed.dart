// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(2)
  UserProfileModel get relatedContact => throw _privateConstructorUsedError;
  @HiveField(3)
  List<MessageModel> get messages => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(includeToJson: false)
  int get unreadMessagesCount => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(includeToJson: false)
  DateTime? get clearedAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  LastMessageModel? get lastMessage => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get iconUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(includeFromJson: false, includeToJson: false)
  PersonalChatSettingsModel? get settings => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  ChatEventType? get chatEventType => throw _privateConstructorUsedError;
  @HiveField(12)
  bool get isPinned => throw _privateConstructorUsedError;
  @HiveField(13)
  bool get isArchived => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(2) UserProfileModel relatedContact,
      @HiveField(3) List<MessageModel> messages,
      @HiveField(6) @JsonKey(includeToJson: false) int unreadMessagesCount,
      @HiveField(7) @JsonKey(includeToJson: false) DateTime? clearedAt,
      @JsonKey(includeToJson: false) LastMessageModel? lastMessage,
      @HiveField(4)
      @JsonKey(includeFromJson: false, includeToJson: false)
      String iconUrl,
      @HiveField(5)
      @JsonKey(includeFromJson: false, includeToJson: false)
      PersonalChatSettingsModel? settings,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ChatEventType? chatEventType,
      @HiveField(12) bool isPinned,
      @HiveField(13) bool isArchived});

  $UserProfileModelCopyWith<$Res> get relatedContact;
  $LastMessageModelCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? relatedContact = null,
    Object? messages = null,
    Object? unreadMessagesCount = null,
    Object? clearedAt = freezed,
    Object? lastMessage = freezed,
    Object? iconUrl = null,
    Object? settings = freezed,
    Object? chatEventType = freezed,
    Object? isPinned = null,
    Object? isArchived = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      relatedContact: null == relatedContact
          ? _value.relatedContact
          : relatedContact // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      unreadMessagesCount: null == unreadMessagesCount
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
      clearedAt: freezed == clearedAt
          ? _value.clearedAt
          : clearedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessageModel?,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PersonalChatSettingsModel?,
      chatEventType: freezed == chatEventType
          ? _value.chatEventType
          : chatEventType // ignore: cast_nullable_to_non_nullable
              as ChatEventType?,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res> get relatedContact {
    return $UserProfileModelCopyWith<$Res>(_value.relatedContact, (value) {
      return _then(_value.copyWith(relatedContact: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LastMessageModelCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $LastMessageModelCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(2) UserProfileModel relatedContact,
      @HiveField(3) List<MessageModel> messages,
      @HiveField(6) @JsonKey(includeToJson: false) int unreadMessagesCount,
      @HiveField(7) @JsonKey(includeToJson: false) DateTime? clearedAt,
      @JsonKey(includeToJson: false) LastMessageModel? lastMessage,
      @HiveField(4)
      @JsonKey(includeFromJson: false, includeToJson: false)
      String iconUrl,
      @HiveField(5)
      @JsonKey(includeFromJson: false, includeToJson: false)
      PersonalChatSettingsModel? settings,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ChatEventType? chatEventType,
      @HiveField(12) bool isPinned,
      @HiveField(13) bool isArchived});

  @override
  $UserProfileModelCopyWith<$Res> get relatedContact;
  @override
  $LastMessageModelCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? relatedContact = null,
    Object? messages = null,
    Object? unreadMessagesCount = null,
    Object? clearedAt = freezed,
    Object? lastMessage = freezed,
    Object? iconUrl = null,
    Object? settings = freezed,
    Object? chatEventType = freezed,
    Object? isPinned = null,
    Object? isArchived = null,
  }) {
    return _then(_$ChatModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      relatedContact: null == relatedContact
          ? _value.relatedContact
          : relatedContact // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      unreadMessagesCount: null == unreadMessagesCount
          ? _value.unreadMessagesCount
          : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
              as int,
      clearedAt: freezed == clearedAt
          ? _value.clearedAt
          : clearedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessageModel?,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PersonalChatSettingsModel?,
      chatEventType: freezed == chatEventType
          ? _value.chatEventType
          : chatEventType // ignore: cast_nullable_to_non_nullable
              as ChatEventType?,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@HiveType(typeId: 5, adapterName: 'ChatModelAdapter')
class _$ChatModelImpl extends _ChatModel {
  const _$ChatModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(2) required this.relatedContact,
      @HiveField(3) final List<MessageModel> messages = const [],
      @HiveField(6) @JsonKey(includeToJson: false) this.unreadMessagesCount = 0,
      @HiveField(7) @JsonKey(includeToJson: false) this.clearedAt,
      @JsonKey(includeToJson: false) this.lastMessage,
      @HiveField(4)
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.iconUrl = '',
      @HiveField(5)
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.settings = null,
      @JsonKey(includeFromJson: false, includeToJson: false) this.chatEventType,
      @HiveField(12) this.isPinned = false,
      @HiveField(13) this.isArchived = false})
      : _messages = messages,
        super._();

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(2)
  final UserProfileModel relatedContact;
  final List<MessageModel> _messages;
  @override
  @JsonKey()
  @HiveField(3)
  List<MessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @HiveField(6)
  @JsonKey(includeToJson: false)
  final int unreadMessagesCount;
  @override
  @HiveField(7)
  @JsonKey(includeToJson: false)
  final DateTime? clearedAt;
  @override
  @JsonKey(includeToJson: false)
  final LastMessageModel? lastMessage;
  @override
  @HiveField(4)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String iconUrl;
  @override
  @HiveField(5)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final PersonalChatSettingsModel? settings;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final ChatEventType? chatEventType;
  @override
  @JsonKey()
  @HiveField(12)
  final bool isPinned;
  @override
  @JsonKey()
  @HiveField(13)
  final bool isArchived;

  @override
  String toString() {
    return 'ChatModel(id: $id, relatedContact: $relatedContact, messages: $messages, unreadMessagesCount: $unreadMessagesCount, clearedAt: $clearedAt, lastMessage: $lastMessage, iconUrl: $iconUrl, settings: $settings, chatEventType: $chatEventType, isPinned: $isPinned, isArchived: $isArchived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.relatedContact, relatedContact) ||
                other.relatedContact == relatedContact) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.unreadMessagesCount, unreadMessagesCount) ||
                other.unreadMessagesCount == unreadMessagesCount) &&
            (identical(other.clearedAt, clearedAt) ||
                other.clearedAt == clearedAt) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality().equals(other.settings, settings) &&
            (identical(other.chatEventType, chatEventType) ||
                other.chatEventType == chatEventType) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      relatedContact,
      const DeepCollectionEquality().hash(_messages),
      unreadMessagesCount,
      clearedAt,
      lastMessage,
      iconUrl,
      const DeepCollectionEquality().hash(settings),
      chatEventType,
      isPinned,
      isArchived);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(
      this,
    );
  }
}

abstract class _ChatModel extends ChatModel {
  const factory _ChatModel(
      {@HiveField(0) required final int id,
      @HiveField(2) required final UserProfileModel relatedContact,
      @HiveField(3) final List<MessageModel> messages,
      @HiveField(6)
      @JsonKey(includeToJson: false)
      final int unreadMessagesCount,
      @HiveField(7) @JsonKey(includeToJson: false) final DateTime? clearedAt,
      @JsonKey(includeToJson: false) final LastMessageModel? lastMessage,
      @HiveField(4)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String iconUrl,
      @HiveField(5)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final PersonalChatSettingsModel? settings,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final ChatEventType? chatEventType,
      @HiveField(12) final bool isPinned,
      @HiveField(13) final bool isArchived}) = _$ChatModelImpl;
  const _ChatModel._() : super._();

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(2)
  UserProfileModel get relatedContact;
  @override
  @HiveField(3)
  List<MessageModel> get messages;
  @override
  @HiveField(6)
  @JsonKey(includeToJson: false)
  int get unreadMessagesCount;
  @override
  @HiveField(7)
  @JsonKey(includeToJson: false)
  DateTime? get clearedAt;
  @override
  @JsonKey(includeToJson: false)
  LastMessageModel? get lastMessage;
  @override
  @HiveField(4)
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get iconUrl;
  @override
  @HiveField(5)
  @JsonKey(includeFromJson: false, includeToJson: false)
  PersonalChatSettingsModel? get settings;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  ChatEventType? get chatEventType;
  @override
  @HiveField(12)
  bool get isPinned;
  @override
  @HiveField(13)
  bool get isArchived;
  @override
  @JsonKey(ignore: true)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
