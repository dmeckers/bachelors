// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_data.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapData {
  @HiveField(0)
  LatLng get currentPosition => throw _privateConstructorUsedError;
  @HiveField(1)
  List<LocationAbstactModel> get locations =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  LocationAbstactModel? get focusedLocationPoint =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapDataCopyWith<MapData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapDataCopyWith<$Res> {
  factory $MapDataCopyWith(MapData value, $Res Function(MapData) then) =
      _$MapDataCopyWithImpl<$Res, MapData>;
  @useResult
  $Res call(
      {@HiveField(0) LatLng currentPosition,
      @HiveField(1) List<LocationAbstactModel> locations,
      @HiveField(2) LocationAbstactModel? focusedLocationPoint});
}

/// @nodoc
class _$MapDataCopyWithImpl<$Res, $Val extends MapData>
    implements $MapDataCopyWith<$Res> {
  _$MapDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPosition = null,
    Object? locations = null,
    Object? focusedLocationPoint = freezed,
  }) {
    return _then(_value.copyWith(
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationAbstactModel>,
      focusedLocationPoint: freezed == focusedLocationPoint
          ? _value.focusedLocationPoint
          : focusedLocationPoint // ignore: cast_nullable_to_non_nullable
              as LocationAbstactModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapDataImplCopyWith<$Res> implements $MapDataCopyWith<$Res> {
  factory _$$MapDataImplCopyWith(
          _$MapDataImpl value, $Res Function(_$MapDataImpl) then) =
      __$$MapDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) LatLng currentPosition,
      @HiveField(1) List<LocationAbstactModel> locations,
      @HiveField(2) LocationAbstactModel? focusedLocationPoint});
}

/// @nodoc
class __$$MapDataImplCopyWithImpl<$Res>
    extends _$MapDataCopyWithImpl<$Res, _$MapDataImpl>
    implements _$$MapDataImplCopyWith<$Res> {
  __$$MapDataImplCopyWithImpl(
      _$MapDataImpl _value, $Res Function(_$MapDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPosition = null,
    Object? locations = null,
    Object? focusedLocationPoint = freezed,
  }) {
    return _then(_$MapDataImpl(
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationAbstactModel>,
      focusedLocationPoint: freezed == focusedLocationPoint
          ? _value.focusedLocationPoint
          : focusedLocationPoint // ignore: cast_nullable_to_non_nullable
              as LocationAbstactModel?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: HiveConstants.LAST_CACHED_MAP_DATA_TYPE_ID)
class _$MapDataImpl extends _MapData {
  const _$MapDataImpl(
      {@HiveField(0) required this.currentPosition,
      @HiveField(1) required final List<LocationAbstactModel> locations,
      @HiveField(2) this.focusedLocationPoint})
      : _locations = locations,
        super._();

  @override
  @HiveField(0)
  final LatLng currentPosition;
  final List<LocationAbstactModel> _locations;
  @override
  @HiveField(1)
  List<LocationAbstactModel> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  @HiveField(2)
  final LocationAbstactModel? focusedLocationPoint;

  @override
  String toString() {
    return 'MapData(currentPosition: $currentPosition, locations: $locations, focusedLocationPoint: $focusedLocationPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapDataImpl &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            (identical(other.focusedLocationPoint, focusedLocationPoint) ||
                other.focusedLocationPoint == focusedLocationPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPosition,
      const DeepCollectionEquality().hash(_locations), focusedLocationPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapDataImplCopyWith<_$MapDataImpl> get copyWith =>
      __$$MapDataImplCopyWithImpl<_$MapDataImpl>(this, _$identity);
}

abstract class _MapData extends MapData {
  const factory _MapData(
          {@HiveField(0) required final LatLng currentPosition,
          @HiveField(1) required final List<LocationAbstactModel> locations,
          @HiveField(2) final LocationAbstactModel? focusedLocationPoint}) =
      _$MapDataImpl;
  const _MapData._() : super._();

  @override
  @HiveField(0)
  LatLng get currentPosition;
  @override
  @HiveField(1)
  List<LocationAbstactModel> get locations;
  @override
  @HiveField(2)
  LocationAbstactModel? get focusedLocationPoint;
  @override
  @JsonKey(ignore: true)
  _$$MapDataImplCopyWith<_$MapDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
