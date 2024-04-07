// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_settings.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatSettingsModel _$ChatSettingsModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'community':
      return CommunityChatSettingsModel.fromJson(json);
    case 'personal':
      return PersonalChatSettingsModel.fromJson(json);
    case 'group':
      return GroupChatSettingsModel.fromJson(json);
    case 'jam':
      return JamChatSettingsModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ChatSettingsModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ChatSettingsModel {
  int get id => throw _privateConstructorUsedError;
  ChatModel get relatedChat => throw _privateConstructorUsedError;
  List<MessageModel> get pinnedMessages => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        community,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        personal,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        group,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        jam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommunityChatSettingsModel value) community,
    required TResult Function(PersonalChatSettingsModel value) personal,
    required TResult Function(GroupChatSettingsModel value) group,
    required TResult Function(JamChatSettingsModel value) jam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommunityChatSettingsModel value)? community,
    TResult? Function(PersonalChatSettingsModel value)? personal,
    TResult? Function(GroupChatSettingsModel value)? group,
    TResult? Function(JamChatSettingsModel value)? jam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommunityChatSettingsModel value)? community,
    TResult Function(PersonalChatSettingsModel value)? personal,
    TResult Function(GroupChatSettingsModel value)? group,
    TResult Function(JamChatSettingsModel value)? jam,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSettingsModelCopyWith<ChatSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSettingsModelCopyWith<$Res> {
  factory $ChatSettingsModelCopyWith(
          ChatSettingsModel value, $Res Function(ChatSettingsModel) then) =
      _$ChatSettingsModelCopyWithImpl<$Res, ChatSettingsModel>;
  @useResult
  $Res call({int id, ChatModel relatedChat, List<MessageModel> pinnedMessages});

  $ChatModelCopyWith<$Res> get relatedChat;
}

/// @nodoc
class _$ChatSettingsModelCopyWithImpl<$Res, $Val extends ChatSettingsModel>
    implements $ChatSettingsModelCopyWith<$Res> {
  _$ChatSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? relatedChat = null,
    Object? pinnedMessages = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      relatedChat: null == relatedChat
          ? _value.relatedChat
          : relatedChat // ignore: cast_nullable_to_non_nullable
              as ChatModel,
      pinnedMessages: null == pinnedMessages
          ? _value.pinnedMessages
          : pinnedMessages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatModelCopyWith<$Res> get relatedChat {
    return $ChatModelCopyWith<$Res>(_value.relatedChat, (value) {
      return _then(_value.copyWith(relatedChat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommunityChatSettingsModelImplCopyWith<$Res>
    implements $ChatSettingsModelCopyWith<$Res> {
  factory _$$CommunityChatSettingsModelImplCopyWith(
          _$CommunityChatSettingsModelImpl value,
          $Res Function(_$CommunityChatSettingsModelImpl) then) =
      __$$CommunityChatSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, ChatModel relatedChat, List<MessageModel> pinnedMessages});

  @override
  $ChatModelCopyWith<$Res> get relatedChat;
}

/// @nodoc
class __$$CommunityChatSettingsModelImplCopyWithImpl<$Res>
    extends _$ChatSettingsModelCopyWithImpl<$Res,
        _$CommunityChatSettingsModelImpl>
    implements _$$CommunityChatSettingsModelImplCopyWith<$Res> {
  __$$CommunityChatSettingsModelImplCopyWithImpl(
      _$CommunityChatSettingsModelImpl _value,
      $Res Function(_$CommunityChatSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? relatedChat = null,
    Object? pinnedMessages = null,
  }) {
    return _then(_$CommunityChatSettingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      relatedChat: null == relatedChat
          ? _value.relatedChat
          : relatedChat // ignore: cast_nullable_to_non_nullable
              as ChatModel,
      pinnedMessages: null == pinnedMessages
          ? _value._pinnedMessages
          : pinnedMessages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityChatSettingsModelImpl extends CommunityChatSettingsModel {
  const _$CommunityChatSettingsModelImpl(
      {required this.id,
      required this.relatedChat,
      final List<MessageModel> pinnedMessages = const [],
      final String? $type})
      : _pinnedMessages = pinnedMessages,
        $type = $type ?? 'community',
        super._();

  factory _$CommunityChatSettingsModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CommunityChatSettingsModelImplFromJson(json);

  @override
  final int id;
  @override
  final ChatModel relatedChat;
  final List<MessageModel> _pinnedMessages;
  @override
  @JsonKey()
  List<MessageModel> get pinnedMessages {
    if (_pinnedMessages is EqualUnmodifiableListView) return _pinnedMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pinnedMessages);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatSettingsModel.community(id: $id, relatedChat: $relatedChat, pinnedMessages: $pinnedMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityChatSettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.relatedChat, relatedChat) ||
                other.relatedChat == relatedChat) &&
            const DeepCollectionEquality()
                .equals(other._pinnedMessages, _pinnedMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, relatedChat,
      const DeepCollectionEquality().hash(_pinnedMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityChatSettingsModelImplCopyWith<_$CommunityChatSettingsModelImpl>
      get copyWith => __$$CommunityChatSettingsModelImplCopyWithImpl<
          _$CommunityChatSettingsModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        community,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        personal,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        group,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        jam,
  }) {
    return community(id, relatedChat, pinnedMessages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
  }) {
    return community?.call(id, relatedChat, pinnedMessages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
    required TResult orElse(),
  }) {
    if (community != null) {
      return community(id, relatedChat, pinnedMessages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommunityChatSettingsModel value) community,
    required TResult Function(PersonalChatSettingsModel value) personal,
    required TResult Function(GroupChatSettingsModel value) group,
    required TResult Function(JamChatSettingsModel value) jam,
  }) {
    return community(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommunityChatSettingsModel value)? community,
    TResult? Function(PersonalChatSettingsModel value)? personal,
    TResult? Function(GroupChatSettingsModel value)? group,
    TResult? Function(JamChatSettingsModel value)? jam,
  }) {
    return community?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommunityChatSettingsModel value)? community,
    TResult Function(PersonalChatSettingsModel value)? personal,
    TResult Function(GroupChatSettingsModel value)? group,
    TResult Function(JamChatSettingsModel value)? jam,
    required TResult orElse(),
  }) {
    if (community != null) {
      return community(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityChatSettingsModelImplToJson(
      this,
    );
  }
}

abstract class CommunityChatSettingsModel extends ChatSettingsModel {
  const factory CommunityChatSettingsModel(
          {required final int id,
          required final ChatModel relatedChat,
          final List<MessageModel> pinnedMessages}) =
      _$CommunityChatSettingsModelImpl;
  const CommunityChatSettingsModel._() : super._();

  factory CommunityChatSettingsModel.fromJson(Map<String, dynamic> json) =
      _$CommunityChatSettingsModelImpl.fromJson;

  @override
  int get id;
  @override
  ChatModel get relatedChat;
  @override
  List<MessageModel> get pinnedMessages;
  @override
  @JsonKey(ignore: true)
  _$$CommunityChatSettingsModelImplCopyWith<_$CommunityChatSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PersonalChatSettingsModelImplCopyWith<$Res>
    implements $ChatSettingsModelCopyWith<$Res> {
  factory _$$PersonalChatSettingsModelImplCopyWith(
          _$PersonalChatSettingsModelImpl value,
          $Res Function(_$PersonalChatSettingsModelImpl) then) =
      __$$PersonalChatSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, ChatModel relatedChat, List<MessageModel> pinnedMessages});

  @override
  $ChatModelCopyWith<$Res> get relatedChat;
}

/// @nodoc
class __$$PersonalChatSettingsModelImplCopyWithImpl<$Res>
    extends _$ChatSettingsModelCopyWithImpl<$Res,
        _$PersonalChatSettingsModelImpl>
    implements _$$PersonalChatSettingsModelImplCopyWith<$Res> {
  __$$PersonalChatSettingsModelImplCopyWithImpl(
      _$PersonalChatSettingsModelImpl _value,
      $Res Function(_$PersonalChatSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? relatedChat = null,
    Object? pinnedMessages = null,
  }) {
    return _then(_$PersonalChatSettingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      relatedChat: null == relatedChat
          ? _value.relatedChat
          : relatedChat // ignore: cast_nullable_to_non_nullable
              as ChatModel,
      pinnedMessages: null == pinnedMessages
          ? _value._pinnedMessages
          : pinnedMessages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalChatSettingsModelImpl extends PersonalChatSettingsModel {
  const _$PersonalChatSettingsModelImpl(
      {required this.id,
      required this.relatedChat,
      final List<MessageModel> pinnedMessages = const [],
      final String? $type})
      : _pinnedMessages = pinnedMessages,
        $type = $type ?? 'personal',
        super._();

  factory _$PersonalChatSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalChatSettingsModelImplFromJson(json);

  @override
  final int id;
  @override
  final ChatModel relatedChat;
  final List<MessageModel> _pinnedMessages;
  @override
  @JsonKey()
  List<MessageModel> get pinnedMessages {
    if (_pinnedMessages is EqualUnmodifiableListView) return _pinnedMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pinnedMessages);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatSettingsModel.personal(id: $id, relatedChat: $relatedChat, pinnedMessages: $pinnedMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalChatSettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.relatedChat, relatedChat) ||
                other.relatedChat == relatedChat) &&
            const DeepCollectionEquality()
                .equals(other._pinnedMessages, _pinnedMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, relatedChat,
      const DeepCollectionEquality().hash(_pinnedMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalChatSettingsModelImplCopyWith<_$PersonalChatSettingsModelImpl>
      get copyWith => __$$PersonalChatSettingsModelImplCopyWithImpl<
          _$PersonalChatSettingsModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        community,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        personal,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        group,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        jam,
  }) {
    return personal(id, relatedChat, pinnedMessages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
  }) {
    return personal?.call(id, relatedChat, pinnedMessages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
    required TResult orElse(),
  }) {
    if (personal != null) {
      return personal(id, relatedChat, pinnedMessages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommunityChatSettingsModel value) community,
    required TResult Function(PersonalChatSettingsModel value) personal,
    required TResult Function(GroupChatSettingsModel value) group,
    required TResult Function(JamChatSettingsModel value) jam,
  }) {
    return personal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommunityChatSettingsModel value)? community,
    TResult? Function(PersonalChatSettingsModel value)? personal,
    TResult? Function(GroupChatSettingsModel value)? group,
    TResult? Function(JamChatSettingsModel value)? jam,
  }) {
    return personal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommunityChatSettingsModel value)? community,
    TResult Function(PersonalChatSettingsModel value)? personal,
    TResult Function(GroupChatSettingsModel value)? group,
    TResult Function(JamChatSettingsModel value)? jam,
    required TResult orElse(),
  }) {
    if (personal != null) {
      return personal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalChatSettingsModelImplToJson(
      this,
    );
  }
}

abstract class PersonalChatSettingsModel extends ChatSettingsModel {
  const factory PersonalChatSettingsModel(
          {required final int id,
          required final ChatModel relatedChat,
          final List<MessageModel> pinnedMessages}) =
      _$PersonalChatSettingsModelImpl;
  const PersonalChatSettingsModel._() : super._();

  factory PersonalChatSettingsModel.fromJson(Map<String, dynamic> json) =
      _$PersonalChatSettingsModelImpl.fromJson;

  @override
  int get id;
  @override
  ChatModel get relatedChat;
  @override
  List<MessageModel> get pinnedMessages;
  @override
  @JsonKey(ignore: true)
  _$$PersonalChatSettingsModelImplCopyWith<_$PersonalChatSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupChatSettingsModelImplCopyWith<$Res>
    implements $ChatSettingsModelCopyWith<$Res> {
  factory _$$GroupChatSettingsModelImplCopyWith(
          _$GroupChatSettingsModelImpl value,
          $Res Function(_$GroupChatSettingsModelImpl) then) =
      __$$GroupChatSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, ChatModel relatedChat, List<MessageModel> pinnedMessages});

  @override
  $ChatModelCopyWith<$Res> get relatedChat;
}

/// @nodoc
class __$$GroupChatSettingsModelImplCopyWithImpl<$Res>
    extends _$ChatSettingsModelCopyWithImpl<$Res, _$GroupChatSettingsModelImpl>
    implements _$$GroupChatSettingsModelImplCopyWith<$Res> {
  __$$GroupChatSettingsModelImplCopyWithImpl(
      _$GroupChatSettingsModelImpl _value,
      $Res Function(_$GroupChatSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? relatedChat = null,
    Object? pinnedMessages = null,
  }) {
    return _then(_$GroupChatSettingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      relatedChat: null == relatedChat
          ? _value.relatedChat
          : relatedChat // ignore: cast_nullable_to_non_nullable
              as ChatModel,
      pinnedMessages: null == pinnedMessages
          ? _value._pinnedMessages
          : pinnedMessages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupChatSettingsModelImpl extends GroupChatSettingsModel {
  const _$GroupChatSettingsModelImpl(
      {required this.id,
      required this.relatedChat,
      final List<MessageModel> pinnedMessages = const [],
      final String? $type})
      : _pinnedMessages = pinnedMessages,
        $type = $type ?? 'group',
        super._();

  factory _$GroupChatSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupChatSettingsModelImplFromJson(json);

  @override
  final int id;
  @override
  final ChatModel relatedChat;
  final List<MessageModel> _pinnedMessages;
  @override
  @JsonKey()
  List<MessageModel> get pinnedMessages {
    if (_pinnedMessages is EqualUnmodifiableListView) return _pinnedMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pinnedMessages);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatSettingsModel.group(id: $id, relatedChat: $relatedChat, pinnedMessages: $pinnedMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupChatSettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.relatedChat, relatedChat) ||
                other.relatedChat == relatedChat) &&
            const DeepCollectionEquality()
                .equals(other._pinnedMessages, _pinnedMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, relatedChat,
      const DeepCollectionEquality().hash(_pinnedMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupChatSettingsModelImplCopyWith<_$GroupChatSettingsModelImpl>
      get copyWith => __$$GroupChatSettingsModelImplCopyWithImpl<
          _$GroupChatSettingsModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        community,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        personal,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        group,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        jam,
  }) {
    return group(id, relatedChat, pinnedMessages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
  }) {
    return group?.call(id, relatedChat, pinnedMessages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(id, relatedChat, pinnedMessages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommunityChatSettingsModel value) community,
    required TResult Function(PersonalChatSettingsModel value) personal,
    required TResult Function(GroupChatSettingsModel value) group,
    required TResult Function(JamChatSettingsModel value) jam,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommunityChatSettingsModel value)? community,
    TResult? Function(PersonalChatSettingsModel value)? personal,
    TResult? Function(GroupChatSettingsModel value)? group,
    TResult? Function(JamChatSettingsModel value)? jam,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommunityChatSettingsModel value)? community,
    TResult Function(PersonalChatSettingsModel value)? personal,
    TResult Function(GroupChatSettingsModel value)? group,
    TResult Function(JamChatSettingsModel value)? jam,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupChatSettingsModelImplToJson(
      this,
    );
  }
}

abstract class GroupChatSettingsModel extends ChatSettingsModel {
  const factory GroupChatSettingsModel(
      {required final int id,
      required final ChatModel relatedChat,
      final List<MessageModel> pinnedMessages}) = _$GroupChatSettingsModelImpl;
  const GroupChatSettingsModel._() : super._();

  factory GroupChatSettingsModel.fromJson(Map<String, dynamic> json) =
      _$GroupChatSettingsModelImpl.fromJson;

  @override
  int get id;
  @override
  ChatModel get relatedChat;
  @override
  List<MessageModel> get pinnedMessages;
  @override
  @JsonKey(ignore: true)
  _$$GroupChatSettingsModelImplCopyWith<_$GroupChatSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JamChatSettingsModelImplCopyWith<$Res>
    implements $ChatSettingsModelCopyWith<$Res> {
  factory _$$JamChatSettingsModelImplCopyWith(_$JamChatSettingsModelImpl value,
          $Res Function(_$JamChatSettingsModelImpl) then) =
      __$$JamChatSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, ChatModel relatedChat, List<MessageModel> pinnedMessages});

  @override
  $ChatModelCopyWith<$Res> get relatedChat;
}

/// @nodoc
class __$$JamChatSettingsModelImplCopyWithImpl<$Res>
    extends _$ChatSettingsModelCopyWithImpl<$Res, _$JamChatSettingsModelImpl>
    implements _$$JamChatSettingsModelImplCopyWith<$Res> {
  __$$JamChatSettingsModelImplCopyWithImpl(_$JamChatSettingsModelImpl _value,
      $Res Function(_$JamChatSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? relatedChat = null,
    Object? pinnedMessages = null,
  }) {
    return _then(_$JamChatSettingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      relatedChat: null == relatedChat
          ? _value.relatedChat
          : relatedChat // ignore: cast_nullable_to_non_nullable
              as ChatModel,
      pinnedMessages: null == pinnedMessages
          ? _value._pinnedMessages
          : pinnedMessages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JamChatSettingsModelImpl extends JamChatSettingsModel {
  const _$JamChatSettingsModelImpl(
      {required this.id,
      required this.relatedChat,
      final List<MessageModel> pinnedMessages = const [],
      final String? $type})
      : _pinnedMessages = pinnedMessages,
        $type = $type ?? 'jam',
        super._();

  factory _$JamChatSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamChatSettingsModelImplFromJson(json);

  @override
  final int id;
  @override
  final ChatModel relatedChat;
  final List<MessageModel> _pinnedMessages;
  @override
  @JsonKey()
  List<MessageModel> get pinnedMessages {
    if (_pinnedMessages is EqualUnmodifiableListView) return _pinnedMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pinnedMessages);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatSettingsModel.jam(id: $id, relatedChat: $relatedChat, pinnedMessages: $pinnedMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamChatSettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.relatedChat, relatedChat) ||
                other.relatedChat == relatedChat) &&
            const DeepCollectionEquality()
                .equals(other._pinnedMessages, _pinnedMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, relatedChat,
      const DeepCollectionEquality().hash(_pinnedMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JamChatSettingsModelImplCopyWith<_$JamChatSettingsModelImpl>
      get copyWith =>
          __$$JamChatSettingsModelImplCopyWithImpl<_$JamChatSettingsModelImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        community,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        personal,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        group,
    required TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)
        jam,
  }) {
    return jam(id, relatedChat, pinnedMessages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult? Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
  }) {
    return jam?.call(id, relatedChat, pinnedMessages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        community,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        personal,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        group,
    TResult Function(
            int id, ChatModel relatedChat, List<MessageModel> pinnedMessages)?
        jam,
    required TResult orElse(),
  }) {
    if (jam != null) {
      return jam(id, relatedChat, pinnedMessages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommunityChatSettingsModel value) community,
    required TResult Function(PersonalChatSettingsModel value) personal,
    required TResult Function(GroupChatSettingsModel value) group,
    required TResult Function(JamChatSettingsModel value) jam,
  }) {
    return jam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommunityChatSettingsModel value)? community,
    TResult? Function(PersonalChatSettingsModel value)? personal,
    TResult? Function(GroupChatSettingsModel value)? group,
    TResult? Function(JamChatSettingsModel value)? jam,
  }) {
    return jam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommunityChatSettingsModel value)? community,
    TResult Function(PersonalChatSettingsModel value)? personal,
    TResult Function(GroupChatSettingsModel value)? group,
    TResult Function(JamChatSettingsModel value)? jam,
    required TResult orElse(),
  }) {
    if (jam != null) {
      return jam(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$JamChatSettingsModelImplToJson(
      this,
    );
  }
}

abstract class JamChatSettingsModel extends ChatSettingsModel {
  const factory JamChatSettingsModel(
      {required final int id,
      required final ChatModel relatedChat,
      final List<MessageModel> pinnedMessages}) = _$JamChatSettingsModelImpl;
  const JamChatSettingsModel._() : super._();

  factory JamChatSettingsModel.fromJson(Map<String, dynamic> json) =
      _$JamChatSettingsModelImpl.fromJson;

  @override
  int get id;
  @override
  ChatModel get relatedChat;
  @override
  List<MessageModel> get pinnedMessages;
  @override
  @JsonKey(ignore: true)
  _$$JamChatSettingsModelImplCopyWith<_$JamChatSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
