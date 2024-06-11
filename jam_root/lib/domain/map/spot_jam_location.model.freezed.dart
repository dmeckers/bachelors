// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot_jam_location.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpotJamLocation {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String get locationName => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(5)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(6)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(7)
  List<VibeModel> get vibes => throw _privateConstructorUsedError;
  @HiveField(8)
  String get creatorId => throw _privateConstructorUsedError;
  BitmapDescriptor? get marker => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpotJamLocationCopyWith<SpotJamLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotJamLocationCopyWith<$Res> {
  factory $SpotJamLocationCopyWith(
          SpotJamLocation value, $Res Function(SpotJamLocation) then) =
      _$SpotJamLocationCopyWithImpl<$Res, SpotJamLocation>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String locationName,
      @HiveField(4) DateTime date,
      @HiveField(5) double latitude,
      @HiveField(6) double longitude,
      @HiveField(7) List<VibeModel> vibes,
      @HiveField(8) String creatorId,
      BitmapDescriptor? marker});
}

/// @nodoc
class _$SpotJamLocationCopyWithImpl<$Res, $Val extends SpotJamLocation>
    implements $SpotJamLocationCopyWith<$Res> {
  _$SpotJamLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? locationName = null,
    Object? date = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? vibes = null,
    Object? creatorId = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpotJamLocationImplCopyWith<$Res>
    implements $SpotJamLocationCopyWith<$Res> {
  factory _$$SpotJamLocationImplCopyWith(_$SpotJamLocationImpl value,
          $Res Function(_$SpotJamLocationImpl) then) =
      __$$SpotJamLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String locationName,
      @HiveField(4) DateTime date,
      @HiveField(5) double latitude,
      @HiveField(6) double longitude,
      @HiveField(7) List<VibeModel> vibes,
      @HiveField(8) String creatorId,
      BitmapDescriptor? marker});
}

/// @nodoc
class __$$SpotJamLocationImplCopyWithImpl<$Res>
    extends _$SpotJamLocationCopyWithImpl<$Res, _$SpotJamLocationImpl>
    implements _$$SpotJamLocationImplCopyWith<$Res> {
  __$$SpotJamLocationImplCopyWithImpl(
      _$SpotJamLocationImpl _value, $Res Function(_$SpotJamLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? locationName = null,
    Object? date = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? vibes = null,
    Object? creatorId = null,
    Object? marker = freezed,
  }) {
    return _then(_$SpotJamLocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: HiveConstants.SPOT_JAM_LOCATION_MODEL_TYPE_ID)
class _$SpotJamLocationImpl extends _SpotJamLocation {
  const _$SpotJamLocationImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.description,
      @HiveField(3) required this.locationName,
      @HiveField(4) required this.date,
      @HiveField(5) required this.latitude,
      @HiveField(6) required this.longitude,
      @HiveField(7) required final List<VibeModel> vibes,
      @HiveField(8) required this.creatorId,
      this.marker})
      : _vibes = vibes,
        super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final String locationName;
  @override
  @HiveField(4)
  final DateTime date;
  @override
  @HiveField(5)
  final double latitude;
  @override
  @HiveField(6)
  final double longitude;
  final List<VibeModel> _vibes;
  @override
  @HiveField(7)
  List<VibeModel> get vibes {
    if (_vibes is EqualUnmodifiableListView) return _vibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vibes);
  }

  @override
  @HiveField(8)
  final String creatorId;
  @override
  final BitmapDescriptor? marker;

  @override
  String toString() {
    return 'SpotJamLocation(id: $id, name: $name, description: $description, locationName: $locationName, date: $date, latitude: $latitude, longitude: $longitude, vibes: $vibes, creatorId: $creatorId, marker: $marker)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpotJamLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._vibes, _vibes) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.marker, marker) || other.marker == marker));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      locationName,
      date,
      latitude,
      longitude,
      const DeepCollectionEquality().hash(_vibes),
      creatorId,
      marker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpotJamLocationImplCopyWith<_$SpotJamLocationImpl> get copyWith =>
      __$$SpotJamLocationImplCopyWithImpl<_$SpotJamLocationImpl>(
          this, _$identity);
}

abstract class _SpotJamLocation extends SpotJamLocation {
  const factory _SpotJamLocation(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String description,
      @HiveField(3) required final String locationName,
      @HiveField(4) required final DateTime date,
      @HiveField(5) required final double latitude,
      @HiveField(6) required final double longitude,
      @HiveField(7) required final List<VibeModel> vibes,
      @HiveField(8) required final String creatorId,
      final BitmapDescriptor? marker}) = _$SpotJamLocationImpl;
  const _SpotJamLocation._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  String get locationName;
  @override
  @HiveField(4)
  DateTime get date;
  @override
  @HiveField(5)
  double get latitude;
  @override
  @HiveField(6)
  double get longitude;
  @override
  @HiveField(7)
  List<VibeModel> get vibes;
  @override
  @HiveField(8)
  String get creatorId;
  @override
  BitmapDescriptor? get marker;
  @override
  @JsonKey(ignore: true)
  _$$SpotJamLocationImplCopyWith<_$SpotJamLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
