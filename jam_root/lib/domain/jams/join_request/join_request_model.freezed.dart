// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JamJoinRequestModel _$JamJoinRequestModelFromJson(Map<String, dynamic> json) {
  return _JamJoinRequestModel.fromJson(json);
}

/// @nodoc
mixin _$JamJoinRequestModel {
  int get id => throw _privateConstructorUsedError;
  int get jamId => throw _privateConstructorUsedError;
  DateTime? get seenAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  ProcessStepTypeEnum get status => throw _privateConstructorUsedError;
  BaseJamFormModel? get filledForm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JamJoinRequestModelCopyWith<JamJoinRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JamJoinRequestModelCopyWith<$Res> {
  factory $JamJoinRequestModelCopyWith(
          JamJoinRequestModel value, $Res Function(JamJoinRequestModel) then) =
      _$JamJoinRequestModelCopyWithImpl<$Res, JamJoinRequestModel>;
  @useResult
  $Res call(
      {int id,
      int jamId,
      DateTime? seenAt,
      String userId,
      ProcessStepTypeEnum status,
      BaseJamFormModel? filledForm});

  $BaseJamFormModelCopyWith<$Res>? get filledForm;
}

/// @nodoc
class _$JamJoinRequestModelCopyWithImpl<$Res, $Val extends JamJoinRequestModel>
    implements $JamJoinRequestModelCopyWith<$Res> {
  _$JamJoinRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jamId = null,
    Object? seenAt = freezed,
    Object? userId = null,
    Object? status = null,
    Object? filledForm = freezed,
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
      seenAt: freezed == seenAt
          ? _value.seenAt
          : seenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessStepTypeEnum,
      filledForm: freezed == filledForm
          ? _value.filledForm
          : filledForm // ignore: cast_nullable_to_non_nullable
              as BaseJamFormModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BaseJamFormModelCopyWith<$Res>? get filledForm {
    if (_value.filledForm == null) {
      return null;
    }

    return $BaseJamFormModelCopyWith<$Res>(_value.filledForm!, (value) {
      return _then(_value.copyWith(filledForm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JamJoinRequestModelImplCopyWith<$Res>
    implements $JamJoinRequestModelCopyWith<$Res> {
  factory _$$JamJoinRequestModelImplCopyWith(_$JamJoinRequestModelImpl value,
          $Res Function(_$JamJoinRequestModelImpl) then) =
      __$$JamJoinRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int jamId,
      DateTime? seenAt,
      String userId,
      ProcessStepTypeEnum status,
      BaseJamFormModel? filledForm});

  @override
  $BaseJamFormModelCopyWith<$Res>? get filledForm;
}

/// @nodoc
class __$$JamJoinRequestModelImplCopyWithImpl<$Res>
    extends _$JamJoinRequestModelCopyWithImpl<$Res, _$JamJoinRequestModelImpl>
    implements _$$JamJoinRequestModelImplCopyWith<$Res> {
  __$$JamJoinRequestModelImplCopyWithImpl(_$JamJoinRequestModelImpl _value,
      $Res Function(_$JamJoinRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jamId = null,
    Object? seenAt = freezed,
    Object? userId = null,
    Object? status = null,
    Object? filledForm = freezed,
  }) {
    return _then(_$JamJoinRequestModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      jamId: null == jamId
          ? _value.jamId
          : jamId // ignore: cast_nullable_to_non_nullable
              as int,
      seenAt: freezed == seenAt
          ? _value.seenAt
          : seenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessStepTypeEnum,
      filledForm: freezed == filledForm
          ? _value.filledForm
          : filledForm // ignore: cast_nullable_to_non_nullable
              as BaseJamFormModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$JamJoinRequestModelImpl implements _JamJoinRequestModel {
  const _$JamJoinRequestModelImpl(
      {required this.id,
      required this.jamId,
      required this.seenAt,
      required this.userId,
      required this.status,
      this.filledForm});

  factory _$JamJoinRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamJoinRequestModelImplFromJson(json);

  @override
  final int id;
  @override
  final int jamId;
  @override
  final DateTime? seenAt;
  @override
  final String userId;
  @override
  final ProcessStepTypeEnum status;
  @override
  final BaseJamFormModel? filledForm;

  @override
  String toString() {
    return 'JamJoinRequestModel(id: $id, jamId: $jamId, seenAt: $seenAt, userId: $userId, status: $status, filledForm: $filledForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamJoinRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jamId, jamId) || other.jamId == jamId) &&
            (identical(other.seenAt, seenAt) || other.seenAt == seenAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.filledForm, filledForm) ||
                other.filledForm == filledForm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, jamId, seenAt, userId, status, filledForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JamJoinRequestModelImplCopyWith<_$JamJoinRequestModelImpl> get copyWith =>
      __$$JamJoinRequestModelImplCopyWithImpl<_$JamJoinRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JamJoinRequestModelImplToJson(
      this,
    );
  }
}

abstract class _JamJoinRequestModel implements JamJoinRequestModel {
  const factory _JamJoinRequestModel(
      {required final int id,
      required final int jamId,
      required final DateTime? seenAt,
      required final String userId,
      required final ProcessStepTypeEnum status,
      final BaseJamFormModel? filledForm}) = _$JamJoinRequestModelImpl;

  factory _JamJoinRequestModel.fromJson(Map<String, dynamic> json) =
      _$JamJoinRequestModelImpl.fromJson;

  @override
  int get id;
  @override
  int get jamId;
  @override
  DateTime? get seenAt;
  @override
  String get userId;
  @override
  ProcessStepTypeEnum get status;
  @override
  BaseJamFormModel? get filledForm;
  @override
  @JsonKey(ignore: true)
  _$$JamJoinRequestModelImplCopyWith<_$JamJoinRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
