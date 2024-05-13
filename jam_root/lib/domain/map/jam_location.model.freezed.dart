// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jam_location.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JamLocation _$JamLocationFromJson(Map<String, dynamic> json) {
  return _JamLocation.fromJson(json);
}

/// @nodoc
mixin _$JamLocation {
  int get jamId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  dynamic get date => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  List<VibeModel> get vibes => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  JamJoinTypeEnum get joinType => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  BitmapDescriptor? get marker => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JamLocationCopyWith<JamLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JamLocationCopyWith<$Res> {
  factory $JamLocationCopyWith(
          JamLocation value, $Res Function(JamLocation) then) =
      _$JamLocationCopyWithImpl<$Res, JamLocation>;
  @useResult
  $Res call(
      {int jamId,
      String name,
      String description,
      String locationName,
      dynamic date,
      double latitude,
      double longitude,
      List<VibeModel> vibes,
      String creatorId,
      JamJoinTypeEnum joinType,
      @JsonKey(includeIfNull: false) BitmapDescriptor? marker});
}

/// @nodoc
class _$JamLocationCopyWithImpl<$Res, $Val extends JamLocation>
    implements $JamLocationCopyWith<$Res> {
  _$JamLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jamId = null,
    Object? name = null,
    Object? description = null,
    Object? locationName = null,
    Object? date = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? vibes = null,
    Object? creatorId = null,
    Object? joinType = null,
    Object? marker = freezed,
  }) {
    return _then(_value.copyWith(
      jamId: null == jamId
          ? _value.jamId
          : jamId // ignore: cast_nullable_to_non_nullable
              as int,
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
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as JamJoinTypeEnum,
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JamLocationImplCopyWith<$Res>
    implements $JamLocationCopyWith<$Res> {
  factory _$$JamLocationImplCopyWith(
          _$JamLocationImpl value, $Res Function(_$JamLocationImpl) then) =
      __$$JamLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int jamId,
      String name,
      String description,
      String locationName,
      dynamic date,
      double latitude,
      double longitude,
      List<VibeModel> vibes,
      String creatorId,
      JamJoinTypeEnum joinType,
      @JsonKey(includeIfNull: false) BitmapDescriptor? marker});
}

/// @nodoc
class __$$JamLocationImplCopyWithImpl<$Res>
    extends _$JamLocationCopyWithImpl<$Res, _$JamLocationImpl>
    implements _$$JamLocationImplCopyWith<$Res> {
  __$$JamLocationImplCopyWithImpl(
      _$JamLocationImpl _value, $Res Function(_$JamLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jamId = null,
    Object? name = null,
    Object? description = null,
    Object? locationName = null,
    Object? date = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? vibes = null,
    Object? creatorId = null,
    Object? joinType = null,
    Object? marker = freezed,
  }) {
    return _then(_$JamLocationImpl(
      jamId: null == jamId
          ? _value.jamId
          : jamId // ignore: cast_nullable_to_non_nullable
              as int,
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
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      joinType: null == joinType
          ? _value.joinType
          : joinType // ignore: cast_nullable_to_non_nullable
              as JamJoinTypeEnum,
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$JamLocationImpl extends _JamLocation {
  const _$JamLocationImpl(
      {required this.jamId,
      required this.name,
      required this.description,
      required this.locationName,
      required this.date,
      required this.latitude,
      required this.longitude,
      required final List<VibeModel> vibes,
      required this.creatorId,
      required this.joinType,
      @JsonKey(includeIfNull: false) this.marker})
      : _vibes = vibes,
        super._();

  factory _$JamLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamLocationImplFromJson(json);

  @override
  final int jamId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String locationName;
  @override
  final dynamic date;
  @override
  final double latitude;
  @override
  final double longitude;
  final List<VibeModel> _vibes;
  @override
  List<VibeModel> get vibes {
    if (_vibes is EqualUnmodifiableListView) return _vibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vibes);
  }

  @override
  final String creatorId;
  @override
  final JamJoinTypeEnum joinType;
  @override
  @JsonKey(includeIfNull: false)
  final BitmapDescriptor? marker;

  @override
  String toString() {
    return 'JamLocation(jamId: $jamId, name: $name, description: $description, locationName: $locationName, date: $date, latitude: $latitude, longitude: $longitude, vibes: $vibes, creatorId: $creatorId, joinType: $joinType, marker: $marker)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamLocationImpl &&
            (identical(other.jamId, jamId) || other.jamId == jamId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other._vibes, _vibes) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.joinType, joinType) ||
                other.joinType == joinType) &&
            (identical(other.marker, marker) || other.marker == marker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jamId,
      name,
      description,
      locationName,
      const DeepCollectionEquality().hash(date),
      latitude,
      longitude,
      const DeepCollectionEquality().hash(_vibes),
      creatorId,
      joinType,
      marker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JamLocationImplCopyWith<_$JamLocationImpl> get copyWith =>
      __$$JamLocationImplCopyWithImpl<_$JamLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JamLocationImplToJson(
      this,
    );
  }
}

abstract class _JamLocation extends JamLocation {
  const factory _JamLocation(
          {required final int jamId,
          required final String name,
          required final String description,
          required final String locationName,
          required final dynamic date,
          required final double latitude,
          required final double longitude,
          required final List<VibeModel> vibes,
          required final String creatorId,
          required final JamJoinTypeEnum joinType,
          @JsonKey(includeIfNull: false) final BitmapDescriptor? marker}) =
      _$JamLocationImpl;
  const _JamLocation._() : super._();

  factory _JamLocation.fromJson(Map<String, dynamic> json) =
      _$JamLocationImpl.fromJson;

  @override
  int get jamId;
  @override
  String get name;
  @override
  String get description;
  @override
  String get locationName;
  @override
  dynamic get date;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  List<VibeModel> get vibes;
  @override
  String get creatorId;
  @override
  JamJoinTypeEnum get joinType;
  @override
  @JsonKey(includeIfNull: false)
  BitmapDescriptor? get marker;
  @override
  @JsonKey(ignore: true)
  _$$JamLocationImplCopyWith<_$JamLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
