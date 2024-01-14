// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forwarded_from.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForwardedFromModel _$ForwardedFromModelFromJson(Map<String, dynamic> json) {
  return _ForwardedFromModel.fromJson(json);
}

/// @nodoc
mixin _$ForwardedFromModel {
  String? get userId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  bool get hideForwardedName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForwardedFromModelCopyWith<ForwardedFromModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForwardedFromModelCopyWith<$Res> {
  factory $ForwardedFromModelCopyWith(
          ForwardedFromModel value, $Res Function(ForwardedFromModel) then) =
      _$ForwardedFromModelCopyWithImpl<$Res, ForwardedFromModel>;
  @useResult
  $Res call({String? userId, String? username, bool hideForwardedName});
}

/// @nodoc
class _$ForwardedFromModelCopyWithImpl<$Res, $Val extends ForwardedFromModel>
    implements $ForwardedFromModelCopyWith<$Res> {
  _$ForwardedFromModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? hideForwardedName = null,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      hideForwardedName: null == hideForwardedName
          ? _value.hideForwardedName
          : hideForwardedName // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForwardedFromModelImplCopyWith<$Res>
    implements $ForwardedFromModelCopyWith<$Res> {
  factory _$$ForwardedFromModelImplCopyWith(_$ForwardedFromModelImpl value,
          $Res Function(_$ForwardedFromModelImpl) then) =
      __$$ForwardedFromModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? username, bool hideForwardedName});
}

/// @nodoc
class __$$ForwardedFromModelImplCopyWithImpl<$Res>
    extends _$ForwardedFromModelCopyWithImpl<$Res, _$ForwardedFromModelImpl>
    implements _$$ForwardedFromModelImplCopyWith<$Res> {
  __$$ForwardedFromModelImplCopyWithImpl(_$ForwardedFromModelImpl _value,
      $Res Function(_$ForwardedFromModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? hideForwardedName = null,
  }) {
    return _then(_$ForwardedFromModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      hideForwardedName: null == hideForwardedName
          ? _value.hideForwardedName
          : hideForwardedName // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ForwardedFromModelImpl implements _ForwardedFromModel {
  const _$ForwardedFromModelImpl(
      {required this.userId,
      required this.username,
      this.hideForwardedName = false});

  factory _$ForwardedFromModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForwardedFromModelImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? username;
  @override
  @JsonKey()
  final bool hideForwardedName;

  @override
  String toString() {
    return 'ForwardedFromModel(userId: $userId, username: $username, hideForwardedName: $hideForwardedName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForwardedFromModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.hideForwardedName, hideForwardedName) ||
                other.hideForwardedName == hideForwardedName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, username, hideForwardedName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForwardedFromModelImplCopyWith<_$ForwardedFromModelImpl> get copyWith =>
      __$$ForwardedFromModelImplCopyWithImpl<_$ForwardedFromModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForwardedFromModelImplToJson(
      this,
    );
  }
}

abstract class _ForwardedFromModel implements ForwardedFromModel {
  const factory _ForwardedFromModel(
      {required final String? userId,
      required final String? username,
      final bool hideForwardedName}) = _$ForwardedFromModelImpl;

  factory _ForwardedFromModel.fromJson(Map<String, dynamic> json) =
      _$ForwardedFromModelImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get username;
  @override
  bool get hideForwardedName;
  @override
  @JsonKey(ignore: true)
  _$$ForwardedFromModelImplCopyWith<_$ForwardedFromModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
