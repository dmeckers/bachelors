// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
  @HiveField(0)
  String? get messageDraft => throw _privateConstructorUsedError;
  @HiveField(1)
  ChatInputMode? get inputMode => throw _privateConstructorUsedError;
  @HiveField(2)
  MessageModel? get model => throw _privateConstructorUsedError;
  @HiveField(3, defaultValue: 0)
  int get page => throw _privateConstructorUsedError;
  @HiveField(4, defaultValue: 0)
  int get totalPages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {@HiveField(0) String? messageDraft,
      @HiveField(1) ChatInputMode? inputMode,
      @HiveField(2) MessageModel? model,
      @HiveField(3, defaultValue: 0) int page,
      @HiveField(4, defaultValue: 0) int totalPages});

  $MessageModelCopyWith<$Res>? get model;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageDraft = freezed,
    Object? inputMode = freezed,
    Object? model = freezed,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_value.copyWith(
      messageDraft: freezed == messageDraft
          ? _value.messageDraft
          : messageDraft // ignore: cast_nullable_to_non_nullable
              as String?,
      inputMode: freezed == inputMode
          ? _value.inputMode
          : inputMode // ignore: cast_nullable_to_non_nullable
              as ChatInputMode?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageModelCopyWith<$Res>? get model {
    if (_value.model == null) {
      return null;
    }

    return $MessageModelCopyWith<$Res>(_value.model!, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? messageDraft,
      @HiveField(1) ChatInputMode? inputMode,
      @HiveField(2) MessageModel? model,
      @HiveField(3, defaultValue: 0) int page,
      @HiveField(4, defaultValue: 0) int totalPages});

  @override
  $MessageModelCopyWith<$Res>? get model;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageDraft = freezed,
    Object? inputMode = freezed,
    Object? model = freezed,
    Object? page = null,
    Object? totalPages = null,
  }) {
    return _then(_$ChatStateImpl(
      messageDraft: freezed == messageDraft
          ? _value.messageDraft
          : messageDraft // ignore: cast_nullable_to_non_nullable
              as String?,
      inputMode: freezed == inputMode
          ? _value.inputMode
          : inputMode // ignore: cast_nullable_to_non_nullable
              as ChatInputMode?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 11, adapterName: 'ChatStateAdapter')
class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl(
      {@HiveField(0) this.messageDraft,
      @HiveField(1) this.inputMode,
      @HiveField(2) this.model,
      @HiveField(3, defaultValue: 0) this.page = 0,
      @HiveField(4, defaultValue: 0) this.totalPages = 0});

  @override
  @HiveField(0)
  final String? messageDraft;
  @override
  @HiveField(1)
  final ChatInputMode? inputMode;
  @override
  @HiveField(2)
  final MessageModel? model;
  @override
  @JsonKey()
  @HiveField(3, defaultValue: 0)
  final int page;
  @override
  @JsonKey()
  @HiveField(4, defaultValue: 0)
  final int totalPages;

  @override
  String toString() {
    return 'ChatState(messageDraft: $messageDraft, inputMode: $inputMode, model: $model, page: $page, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.messageDraft, messageDraft) ||
                other.messageDraft == messageDraft) &&
            (identical(other.inputMode, inputMode) ||
                other.inputMode == inputMode) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, messageDraft, inputMode, model, page, totalPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {@HiveField(0) final String? messageDraft,
      @HiveField(1) final ChatInputMode? inputMode,
      @HiveField(2) final MessageModel? model,
      @HiveField(3, defaultValue: 0) final int page,
      @HiveField(4, defaultValue: 0) final int totalPages}) = _$ChatStateImpl;

  @override
  @HiveField(0)
  String? get messageDraft;
  @override
  @HiveField(1)
  ChatInputMode? get inputMode;
  @override
  @HiveField(2)
  MessageModel? get model;
  @override
  @HiveField(3, defaultValue: 0)
  int get page;
  @override
  @HiveField(4, defaultValue: 0)
  int get totalPages;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
