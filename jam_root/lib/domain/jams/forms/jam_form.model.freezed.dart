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

BaseJamFormModel _$BaseJamFormModelFromJson(Map<String, dynamic> json) {
  return _BaseJamFormModel.fromJson(json);
}

/// @nodoc
mixin _$BaseJamFormModel {
  List<JamFormElementData> get elements => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get filledByUserId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseJamFormModelCopyWith<BaseJamFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseJamFormModelCopyWith<$Res> {
  factory $BaseJamFormModelCopyWith(
          BaseJamFormModel value, $Res Function(BaseJamFormModel) then) =
      _$BaseJamFormModelCopyWithImpl<$Res, BaseJamFormModel>;
  @useResult
  $Res call(
      {List<JamFormElementData> elements,
      String title,
      @JsonKey(includeIfNull: false) String? filledByUserId});
}

/// @nodoc
class _$BaseJamFormModelCopyWithImpl<$Res, $Val extends BaseJamFormModel>
    implements $BaseJamFormModelCopyWith<$Res> {
  _$BaseJamFormModelCopyWithImpl(this._value, this._then);

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
abstract class _$$BaseJamFormModelImplCopyWith<$Res>
    implements $BaseJamFormModelCopyWith<$Res> {
  factory _$$BaseJamFormModelImplCopyWith(_$BaseJamFormModelImpl value,
          $Res Function(_$BaseJamFormModelImpl) then) =
      __$$BaseJamFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<JamFormElementData> elements,
      String title,
      @JsonKey(includeIfNull: false) String? filledByUserId});
}

/// @nodoc
class __$$BaseJamFormModelImplCopyWithImpl<$Res>
    extends _$BaseJamFormModelCopyWithImpl<$Res, _$BaseJamFormModelImpl>
    implements _$$BaseJamFormModelImplCopyWith<$Res> {
  __$$BaseJamFormModelImplCopyWithImpl(_$BaseJamFormModelImpl _value,
      $Res Function(_$BaseJamFormModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
    Object? title = null,
    Object? filledByUserId = freezed,
  }) {
    return _then(_$BaseJamFormModelImpl(
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
class _$BaseJamFormModelImpl implements _BaseJamFormModel {
  const _$BaseJamFormModelImpl(
      {required final List<JamFormElementData> elements,
      required this.title,
      @JsonKey(includeIfNull: false) this.filledByUserId})
      : _elements = elements;

  factory _$BaseJamFormModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseJamFormModelImplFromJson(json);

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
    return 'BaseJamFormModel(elements: $elements, title: $title, filledByUserId: $filledByUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseJamFormModelImpl &&
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
  _$$BaseJamFormModelImplCopyWith<_$BaseJamFormModelImpl> get copyWith =>
      __$$BaseJamFormModelImplCopyWithImpl<_$BaseJamFormModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseJamFormModelImplToJson(
      this,
    );
  }
}

abstract class _BaseJamFormModel implements BaseJamFormModel {
  const factory _BaseJamFormModel(
          {required final List<JamFormElementData> elements,
          required final String title,
          @JsonKey(includeIfNull: false) final String? filledByUserId}) =
      _$BaseJamFormModelImpl;

  factory _BaseJamFormModel.fromJson(Map<String, dynamic> json) =
      _$BaseJamFormModelImpl.fromJson;

  @override
  List<JamFormElementData> get elements;
  @override
  String get title;
  @override
  @JsonKey(includeIfNull: false)
  String? get filledByUserId;
  @override
  @JsonKey(ignore: true)
  _$$BaseJamFormModelImplCopyWith<_$BaseJamFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
