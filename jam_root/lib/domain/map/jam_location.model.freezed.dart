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
  @HiveField(0)
  int get jamId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String get locationName => throw _privateConstructorUsedError;
  @HiveField(4)
  dynamic get date => throw _privateConstructorUsedError;
  @HiveField(5)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(6)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(7)
  List<VibeModel> get vibes => throw _privateConstructorUsedError;
  @HiveField(8)
  String get creatorId => throw _privateConstructorUsedError;
  @HiveField(9)
  JamJoinTypeEnum get joinType => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get creatorFcmToken => throw _privateConstructorUsedError;
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
      {@HiveField(0) int jamId,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String locationName,
      @HiveField(4) dynamic date,
      @HiveField(5) double latitude,
      @HiveField(6) double longitude,
      @HiveField(7) List<VibeModel> vibes,
      @HiveField(8) String creatorId,
      @HiveField(9) JamJoinTypeEnum joinType,
      @HiveField(10) String? creatorFcmToken,
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
    Object? creatorFcmToken = freezed,
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
      creatorFcmToken: freezed == creatorFcmToken
          ? _value.creatorFcmToken
          : creatorFcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@HiveField(0) int jamId,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String locationName,
      @HiveField(4) dynamic date,
      @HiveField(5) double latitude,
      @HiveField(6) double longitude,
      @HiveField(7) List<VibeModel> vibes,
      @HiveField(8) String creatorId,
      @HiveField(9) JamJoinTypeEnum joinType,
      @HiveField(10) String? creatorFcmToken,
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
    Object? creatorFcmToken = freezed,
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
      creatorFcmToken: freezed == creatorFcmToken
          ? _value.creatorFcmToken
          : creatorFcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@HiveType(typeId: HiveConstants.JAM_LOCATION_MODEL_TYPE_ID)
class _$JamLocationImpl extends _JamLocation {
  const _$JamLocationImpl(
      {@HiveField(0) required this.jamId,
      @HiveField(1) required this.name,
      @HiveField(2) required this.description,
      @HiveField(3) required this.locationName,
      @HiveField(4) required this.date,
      @HiveField(5) required this.latitude,
      @HiveField(6) required this.longitude,
      @HiveField(7) required final List<VibeModel> vibes,
      @HiveField(8) required this.creatorId,
      @HiveField(9) required this.joinType,
      @HiveField(10) this.creatorFcmToken,
      @JsonKey(includeIfNull: false) this.marker})
      : _vibes = vibes,
        super._();

  factory _$JamLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamLocationImplFromJson(json);

  @override
  @HiveField(0)
  final int jamId;
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
  final dynamic date;
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
  @HiveField(9)
  final JamJoinTypeEnum joinType;
  @override
  @HiveField(10)
  final String? creatorFcmToken;
  @override
  @JsonKey(includeIfNull: false)
  final BitmapDescriptor? marker;

  @override
  String toString() {
    return 'JamLocation(jamId: $jamId, name: $name, description: $description, locationName: $locationName, date: $date, latitude: $latitude, longitude: $longitude, vibes: $vibes, creatorId: $creatorId, joinType: $joinType, creatorFcmToken: $creatorFcmToken, marker: $marker)';
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
            (identical(other.creatorFcmToken, creatorFcmToken) ||
                other.creatorFcmToken == creatorFcmToken) &&
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
      creatorFcmToken,
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
          {@HiveField(0) required final int jamId,
          @HiveField(1) required final String name,
          @HiveField(2) required final String description,
          @HiveField(3) required final String locationName,
          @HiveField(4) required final dynamic date,
          @HiveField(5) required final double latitude,
          @HiveField(6) required final double longitude,
          @HiveField(7) required final List<VibeModel> vibes,
          @HiveField(8) required final String creatorId,
          @HiveField(9) required final JamJoinTypeEnum joinType,
          @HiveField(10) final String? creatorFcmToken,
          @JsonKey(includeIfNull: false) final BitmapDescriptor? marker}) =
      _$JamLocationImpl;
  const _JamLocation._() : super._();

  factory _JamLocation.fromJson(Map<String, dynamic> json) =
      _$JamLocationImpl.fromJson;

  @override
  @HiveField(0)
  int get jamId;
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
  dynamic get date;
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
  @HiveField(9)
  JamJoinTypeEnum get joinType;
  @override
  @HiveField(10)
  String? get creatorFcmToken;
  @override
  @JsonKey(includeIfNull: false)
  BitmapDescriptor? get marker;
  @override
  @JsonKey(ignore: true)
  _$$JamLocationImplCopyWith<_$JamLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
