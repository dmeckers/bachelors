// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jam_form.model.dart';

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
  List<JamFormElementData> get elements => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get filledByUserId => throw _privateConstructorUsedError;

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
      {List<JamFormElementData> elements,
      String title,
      @JsonKey(includeIfNull: false) String? filledByUserId});
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
    Object? elements = null,
    Object? title = null,
    Object? filledByUserId = freezed,
  }) {
    return _then(_value.copyWith(
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<JamFormElementData>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      filledByUserId: freezed == filledByUserId
          ? _value.filledByUserId
          : filledByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {List<JamFormElementData> elements,
      String title,
      @JsonKey(includeIfNull: false) String? filledByUserId});
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
    Object? elements = null,
    Object? title = null,
    Object? filledByUserId = freezed,
  }) {
    return _then(_$JamJoinRequestModelImpl(
      elements: null == elements
          ? _value._elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<JamFormElementData>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      filledByUserId: freezed == filledByUserId
          ? _value.filledByUserId
          : filledByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$JamJoinRequestModelImpl implements _JamJoinRequestModel {
  const _$JamJoinRequestModelImpl(
      {required final List<JamFormElementData> elements,
      required this.title,
      @JsonKey(includeIfNull: false) this.filledByUserId})
      : _elements = elements;

  factory _$JamJoinRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamJoinRequestModelImplFromJson(json);

  final List<JamFormElementData> _elements;
  @override
  List<JamFormElementData> get elements {
    if (_elements is EqualUnmodifiableListView) return _elements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_elements);
  }

  @override
  final String title;
  @override
  @JsonKey(includeIfNull: false)
  final String? filledByUserId;

  @override
  String toString() {
    return 'JamJoinRequestModel(elements: $elements, title: $title, filledByUserId: $filledByUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamJoinRequestModelImpl &&
            const DeepCollectionEquality().equals(other._elements, _elements) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.filledByUserId, filledByUserId) ||
                other.filledByUserId == filledByUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_elements), title, filledByUserId);

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
          {required final List<JamFormElementData> elements,
          required final String title,
          @JsonKey(includeIfNull: false) final String? filledByUserId}) =
      _$JamJoinRequestModelImpl;

  factory _JamJoinRequestModel.fromJson(Map<String, dynamic> json) =
      _$JamJoinRequestModelImpl.fromJson;

  @override
  List<JamFormElementData> get elements;
  @override
  String get title;
  @override
  @JsonKey(includeIfNull: false)
  String? get filledByUserId;
  @override
  @JsonKey(ignore: true)
  _$$JamJoinRequestModelImplCopyWith<_$JamJoinRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
