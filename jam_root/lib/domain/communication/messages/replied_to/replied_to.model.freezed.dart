// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replied_to.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepliedToModel _$RepliedToModelFromJson(Map<String, dynamic> json) {
  return _RepliedToModel.fromJson(json);
}

/// @nodoc
mixin _$RepliedToModel {
  int get messageId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  MessageType get messageType => throw _privateConstructorUsedError;
  String get messageText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepliedToModelCopyWith<RepliedToModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepliedToModelCopyWith<$Res> {
  factory $RepliedToModelCopyWith(
          RepliedToModel value, $Res Function(RepliedToModel) then) =
      _$RepliedToModelCopyWithImpl<$Res, RepliedToModel>;
  @useResult
  $Res call(
      {int messageId,
      String senderId,
      MessageType messageType,
      String messageText});
}

/// @nodoc
class _$RepliedToModelCopyWithImpl<$Res, $Val extends RepliedToModel>
    implements $RepliedToModelCopyWith<$Res> {
  _$RepliedToModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? senderId = null,
    Object? messageType = null,
    Object? messageText = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      messageText: null == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepliedToModelImplCopyWith<$Res>
    implements $RepliedToModelCopyWith<$Res> {
  factory _$$RepliedToModelImplCopyWith(_$RepliedToModelImpl value,
          $Res Function(_$RepliedToModelImpl) then) =
      __$$RepliedToModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int messageId,
      String senderId,
      MessageType messageType,
      String messageText});
}

/// @nodoc
class __$$RepliedToModelImplCopyWithImpl<$Res>
    extends _$RepliedToModelCopyWithImpl<$Res, _$RepliedToModelImpl>
    implements _$$RepliedToModelImplCopyWith<$Res> {
  __$$RepliedToModelImplCopyWithImpl(
      _$RepliedToModelImpl _value, $Res Function(_$RepliedToModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? senderId = null,
    Object? messageType = null,
    Object? messageText = null,
  }) {
    return _then(_$RepliedToModelImpl(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
      messageText: null == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RepliedToModelImpl implements _RepliedToModel {
  const _$RepliedToModelImpl(
      {required this.messageId,
      required this.senderId,
      required this.messageType,
      required this.messageText});

  factory _$RepliedToModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepliedToModelImplFromJson(json);

  @override
  final int messageId;
  @override
  final String senderId;
  @override
  final MessageType messageType;
  @override
  final String messageText;

  @override
  String toString() {
    return 'RepliedToModel(messageId: $messageId, senderId: $senderId, messageType: $messageType, messageText: $messageText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepliedToModelImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, messageId, senderId, messageType, messageText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepliedToModelImplCopyWith<_$RepliedToModelImpl> get copyWith =>
      __$$RepliedToModelImplCopyWithImpl<_$RepliedToModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepliedToModelImplToJson(
      this,
    );
  }
}

abstract class _RepliedToModel implements RepliedToModel {
  const factory _RepliedToModel(
      {required final int messageId,
      required final String senderId,
      required final MessageType messageType,
      required final String messageText}) = _$RepliedToModelImpl;

  factory _RepliedToModel.fromJson(Map<String, dynamic> json) =
      _$RepliedToModelImpl.fromJson;

  @override
  int get messageId;
  @override
  String get senderId;
  @override
  MessageType get messageType;
  @override
  String get messageText;
  @override
  @JsonKey(ignore: true)
  _$$RepliedToModelImplCopyWith<_$RepliedToModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
