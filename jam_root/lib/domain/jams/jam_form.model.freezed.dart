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

JamFormModel _$JamFormModelFromJson(Map<String, dynamic> json) {
  return _JamFormModel.fromJson(json);
}

/// @nodoc
mixin _$JamFormModel {
  List<JamFormElementData> get elements => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JamFormModelCopyWith<JamFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JamFormModelCopyWith<$Res> {
  factory $JamFormModelCopyWith(
          JamFormModel value, $Res Function(JamFormModel) then) =
      _$JamFormModelCopyWithImpl<$Res, JamFormModel>;
  @useResult
  $Res call({List<JamFormElementData> elements, String title});
}

/// @nodoc
class _$JamFormModelCopyWithImpl<$Res, $Val extends JamFormModel>
    implements $JamFormModelCopyWith<$Res> {
  _$JamFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JamFormModelImplCopyWith<$Res>
    implements $JamFormModelCopyWith<$Res> {
  factory _$$JamFormModelImplCopyWith(
          _$JamFormModelImpl value, $Res Function(_$JamFormModelImpl) then) =
      __$$JamFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<JamFormElementData> elements, String title});
}

/// @nodoc
class __$$JamFormModelImplCopyWithImpl<$Res>
    extends _$JamFormModelCopyWithImpl<$Res, _$JamFormModelImpl>
    implements _$$JamFormModelImplCopyWith<$Res> {
  __$$JamFormModelImplCopyWithImpl(
      _$JamFormModelImpl _value, $Res Function(_$JamFormModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
    Object? title = null,
  }) {
    return _then(_$JamFormModelImpl(
      elements: null == elements
          ? _value._elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<JamFormElementData>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$JamFormModelImpl implements _JamFormModel {
  const _$JamFormModelImpl(
      {required final List<JamFormElementData> elements, required this.title})
      : _elements = elements;

  factory _$JamFormModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamFormModelImplFromJson(json);

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
  String toString() {
    return 'JamFormModel(elements: $elements, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamFormModelImpl &&
            const DeepCollectionEquality().equals(other._elements, _elements) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_elements), title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JamFormModelImplCopyWith<_$JamFormModelImpl> get copyWith =>
      __$$JamFormModelImplCopyWithImpl<_$JamFormModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JamFormModelImplToJson(
      this,
    );
  }
}

abstract class _JamFormModel implements JamFormModel {
  const factory _JamFormModel(
      {required final List<JamFormElementData> elements,
      required final String title}) = _$JamFormModelImpl;

  factory _JamFormModel.fromJson(Map<String, dynamic> json) =
      _$JamFormModelImpl.fromJson;

  @override
  List<JamFormElementData> get elements;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$JamFormModelImplCopyWith<_$JamFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
