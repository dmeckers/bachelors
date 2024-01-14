// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vibe.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VibeModel _$VibeModelFromJson(Map<String, dynamic> json) {
  return _VibeModel.fromJson(json);
}

/// @nodoc
mixin _$VibeModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get iconUrl => throw _privateConstructorUsedError;
  @HiveField(4)
  List<VibeModel>? get childVibes => throw _privateConstructorUsedError;
  @HiveField(5)
  List<VibeModel>? get parentVibes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VibeModelCopyWith<VibeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VibeModelCopyWith<$Res> {
  factory $VibeModelCopyWith(VibeModel value, $Res Function(VibeModel) then) =
      _$VibeModelCopyWithImpl<$Res, VibeModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3) String? iconUrl,
      @HiveField(4) List<VibeModel>? childVibes,
      @HiveField(5) List<VibeModel>? parentVibes});
}

/// @nodoc
class _$VibeModelCopyWithImpl<$Res, $Val extends VibeModel>
    implements $VibeModelCopyWith<$Res> {
  _$VibeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? iconUrl = freezed,
    Object? childVibes = freezed,
    Object? parentVibes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      childVibes: freezed == childVibes
          ? _value.childVibes
          : childVibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>?,
      parentVibes: freezed == parentVibes
          ? _value.parentVibes
          : parentVibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VibeModelImplCopyWith<$Res>
    implements $VibeModelCopyWith<$Res> {
  factory _$$VibeModelImplCopyWith(
          _$VibeModelImpl value, $Res Function(_$VibeModelImpl) then) =
      __$$VibeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3) String? iconUrl,
      @HiveField(4) List<VibeModel>? childVibes,
      @HiveField(5) List<VibeModel>? parentVibes});
}

/// @nodoc
class __$$VibeModelImplCopyWithImpl<$Res>
    extends _$VibeModelCopyWithImpl<$Res, _$VibeModelImpl>
    implements _$$VibeModelImplCopyWith<$Res> {
  __$$VibeModelImplCopyWithImpl(
      _$VibeModelImpl _value, $Res Function(_$VibeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? iconUrl = freezed,
    Object? childVibes = freezed,
    Object? parentVibes = freezed,
  }) {
    return _then(_$VibeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      childVibes: freezed == childVibes
          ? _value._childVibes
          : childVibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>?,
      parentVibes: freezed == parentVibes
          ? _value._parentVibes
          : parentVibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 15)
@JsonSerializable(fieldRename: FieldRename.snake)
class _$VibeModelImpl extends _VibeModel {
  const _$VibeModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.description,
      @HiveField(3) required this.iconUrl,
      @HiveField(4) final List<VibeModel>? childVibes = const [],
      @HiveField(5) final List<VibeModel>? parentVibes = const []})
      : _childVibes = childVibes,
        _parentVibes = parentVibes,
        super._();

  factory _$VibeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VibeModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  final String? iconUrl;
  final List<VibeModel>? _childVibes;
  @override
  @JsonKey()
  @HiveField(4)
  List<VibeModel>? get childVibes {
    final value = _childVibes;
    if (value == null) return null;
    if (_childVibes is EqualUnmodifiableListView) return _childVibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VibeModel>? _parentVibes;
  @override
  @JsonKey()
  @HiveField(5)
  List<VibeModel>? get parentVibes {
    final value = _parentVibes;
    if (value == null) return null;
    if (_parentVibes is EqualUnmodifiableListView) return _parentVibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VibeModel(id: $id, name: $name, description: $description, iconUrl: $iconUrl, childVibes: $childVibes, parentVibes: $parentVibes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VibeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            const DeepCollectionEquality()
                .equals(other._childVibes, _childVibes) &&
            const DeepCollectionEquality()
                .equals(other._parentVibes, _parentVibes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      iconUrl,
      const DeepCollectionEquality().hash(_childVibes),
      const DeepCollectionEquality().hash(_parentVibes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VibeModelImplCopyWith<_$VibeModelImpl> get copyWith =>
      __$$VibeModelImplCopyWithImpl<_$VibeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VibeModelImplToJson(
      this,
    );
  }
}

abstract class _VibeModel extends VibeModel {
  const factory _VibeModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String? description,
      @HiveField(3) required final String? iconUrl,
      @HiveField(4) final List<VibeModel>? childVibes,
      @HiveField(5) final List<VibeModel>? parentVibes}) = _$VibeModelImpl;
  const _VibeModel._() : super._();

  factory _VibeModel.fromJson(Map<String, dynamic> json) =
      _$VibeModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String? get description;
  @override
  @HiveField(3)
  String? get iconUrl;
  @override
  @HiveField(4)
  List<VibeModel>? get childVibes;
  @override
  @HiveField(5)
  List<VibeModel>? get parentVibes;
  @override
  @JsonKey(ignore: true)
  _$$VibeModelImplCopyWith<_$VibeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
