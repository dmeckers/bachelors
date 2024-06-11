// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_place_result.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchPlaceResult {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  List<VibeModel> get vibes => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  LocationType get type => throw _privateConstructorUsedError;
  BitmapDescriptor? get marker => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPlaceResultCopyWith<SearchPlaceResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPlaceResultCopyWith<$Res> {
  factory $SearchPlaceResultCopyWith(
          SearchPlaceResult value, $Res Function(SearchPlaceResult) then) =
      _$SearchPlaceResultCopyWithImpl<$Res, SearchPlaceResult>;
  @useResult
  $Res call(
      {String id,
      String name,
      double latitude,
      double longitude,
      List<VibeModel> vibes,
      String creatorId,
      LocationType type,
      BitmapDescriptor? marker});
}

/// @nodoc
class _$SearchPlaceResultCopyWithImpl<$Res, $Val extends SearchPlaceResult>
    implements $SearchPlaceResultCopyWith<$Res> {
  _$SearchPlaceResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? vibes = null,
    Object? creatorId = null,
    Object? type = null,
    Object? marker = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      vibes: null == vibes
          ? _value.vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LocationType,
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPlaceResultImplCopyWith<$Res>
    implements $SearchPlaceResultCopyWith<$Res> {
  factory _$$SearchPlaceResultImplCopyWith(_$SearchPlaceResultImpl value,
          $Res Function(_$SearchPlaceResultImpl) then) =
      __$$SearchPlaceResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double latitude,
      double longitude,
      List<VibeModel> vibes,
      String creatorId,
      LocationType type,
      BitmapDescriptor? marker});
}

/// @nodoc
class __$$SearchPlaceResultImplCopyWithImpl<$Res>
    extends _$SearchPlaceResultCopyWithImpl<$Res, _$SearchPlaceResultImpl>
    implements _$$SearchPlaceResultImplCopyWith<$Res> {
  __$$SearchPlaceResultImplCopyWithImpl(_$SearchPlaceResultImpl _value,
      $Res Function(_$SearchPlaceResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? vibes = null,
    Object? creatorId = null,
    Object? type = null,
    Object? marker = freezed,
  }) {
    return _then(_$SearchPlaceResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      vibes: null == vibes
          ? _value._vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LocationType,
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ));
  }
}

/// @nodoc

class _$SearchPlaceResultImpl extends _SearchPlaceResult {
  const _$SearchPlaceResultImpl(
      {this.id = 'places',
      required this.name,
      required this.latitude,
      required this.longitude,
      final List<VibeModel> vibes = const [],
      this.creatorId = '',
      this.type = LocationType.placeSearchResult,
      this.marker})
      : _vibes = vibes,
        super._();

  @override
  @JsonKey()
  final String id;
  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  final List<VibeModel> _vibes;
  @override
  @JsonKey()
  List<VibeModel> get vibes {
    if (_vibes is EqualUnmodifiableListView) return _vibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vibes);
  }

  @override
  @JsonKey()
  final String creatorId;
  @override
  @JsonKey()
  final LocationType type;
  @override
  final BitmapDescriptor? marker;

  @override
  String toString() {
    return 'SearchPlaceResult(id: $id, name: $name, latitude: $latitude, longitude: $longitude, vibes: $vibes, creatorId: $creatorId, type: $type, marker: $marker)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPlaceResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._vibes, _vibes) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.marker, marker) || other.marker == marker));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, latitude, longitude,
      const DeepCollectionEquality().hash(_vibes), creatorId, type, marker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPlaceResultImplCopyWith<_$SearchPlaceResultImpl> get copyWith =>
      __$$SearchPlaceResultImplCopyWithImpl<_$SearchPlaceResultImpl>(
          this, _$identity);
}

abstract class _SearchPlaceResult extends SearchPlaceResult {
  const factory _SearchPlaceResult(
      {final String id,
      required final String name,
      required final double latitude,
      required final double longitude,
      final List<VibeModel> vibes,
      final String creatorId,
      final LocationType type,
      final BitmapDescriptor? marker}) = _$SearchPlaceResultImpl;
  const _SearchPlaceResult._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  List<VibeModel> get vibes;
  @override
  String get creatorId;
  @override
  LocationType get type;
  @override
  BitmapDescriptor? get marker;
  @override
  @JsonKey(ignore: true)
  _$$SearchPlaceResultImplCopyWith<_$SearchPlaceResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
