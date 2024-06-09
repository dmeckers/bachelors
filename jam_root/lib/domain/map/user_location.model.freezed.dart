// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) {
  return _UserLocation.fromJson(json);
}

/// @nodoc
mixin _$UserLocation {
  @HiveField(0)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(readValue: _UserLocationJson.readName)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  List<VibeModel> get vibes => throw _privateConstructorUsedError;
  @HiveField(3)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(4)
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  BitmapDescriptor? get marker => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isFriend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLocationCopyWith<UserLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationCopyWith<$Res> {
  factory $UserLocationCopyWith(
          UserLocation value, $Res Function(UserLocation) then) =
      _$UserLocationCopyWithImpl<$Res, UserLocation>;
  @useResult
  $Res call(
      {@HiveField(0) String userId,
      @HiveField(1) @JsonKey(readValue: _UserLocationJson.readName) String name,
      @HiveField(2) List<VibeModel> vibes,
      @HiveField(3) double latitude,
      @HiveField(4) double longitude,
      @JsonKey(includeIfNull: false) BitmapDescriptor? marker,
      @HiveField(5) bool isFriend});
}

/// @nodoc
class _$UserLocationCopyWithImpl<$Res, $Val extends UserLocation>
    implements $UserLocationCopyWith<$Res> {
  _$UserLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? vibes = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? marker = freezed,
    Object? isFriend = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vibes: null == vibes
          ? _value.vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLocationImplCopyWith<$Res>
    implements $UserLocationCopyWith<$Res> {
  factory _$$UserLocationImplCopyWith(
          _$UserLocationImpl value, $Res Function(_$UserLocationImpl) then) =
      __$$UserLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String userId,
      @HiveField(1) @JsonKey(readValue: _UserLocationJson.readName) String name,
      @HiveField(2) List<VibeModel> vibes,
      @HiveField(3) double latitude,
      @HiveField(4) double longitude,
      @JsonKey(includeIfNull: false) BitmapDescriptor? marker,
      @HiveField(5) bool isFriend});
}

/// @nodoc
class __$$UserLocationImplCopyWithImpl<$Res>
    extends _$UserLocationCopyWithImpl<$Res, _$UserLocationImpl>
    implements _$$UserLocationImplCopyWith<$Res> {
  __$$UserLocationImplCopyWithImpl(
      _$UserLocationImpl _value, $Res Function(_$UserLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? vibes = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? marker = freezed,
    Object? isFriend = null,
  }) {
    return _then(_$UserLocationImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vibes: null == vibes
          ? _value._vibes
          : vibes // ignore: cast_nullable_to_non_nullable
              as List<VibeModel>,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      marker: freezed == marker
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as BitmapDescriptor?,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@HiveType(typeId: HiveConstants.USER_LOCATION_MODEL_TYPE_ID)
class _$UserLocationImpl extends _UserLocation {
  const _$UserLocationImpl(
      {@HiveField(0) required this.userId,
      @HiveField(1)
      @JsonKey(readValue: _UserLocationJson.readName)
      required this.name,
      @HiveField(2) required final List<VibeModel> vibes,
      @HiveField(3) required this.latitude,
      @HiveField(4) required this.longitude,
      @JsonKey(includeIfNull: false) this.marker,
      @HiveField(5) required this.isFriend})
      : _vibes = vibes,
        super._();

  factory _$UserLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLocationImplFromJson(json);

  @override
  @HiveField(0)
  final String userId;
  @override
  @HiveField(1)
  @JsonKey(readValue: _UserLocationJson.readName)
  final String name;
  final List<VibeModel> _vibes;
  @override
  @HiveField(2)
  List<VibeModel> get vibes {
    if (_vibes is EqualUnmodifiableListView) return _vibes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vibes);
  }

  @override
  @HiveField(3)
  final double latitude;
  @override
  @HiveField(4)
  final double longitude;
  @override
  @JsonKey(includeIfNull: false)
  final BitmapDescriptor? marker;
  @override
  @HiveField(5)
  final bool isFriend;

  @override
  String toString() {
    return 'UserLocation(userId: $userId, name: $name, vibes: $vibes, latitude: $latitude, longitude: $longitude, marker: $marker, isFriend: $isFriend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLocationImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._vibes, _vibes) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.marker, marker) || other.marker == marker) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      name,
      const DeepCollectionEquality().hash(_vibes),
      latitude,
      longitude,
      marker,
      isFriend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLocationImplCopyWith<_$UserLocationImpl> get copyWith =>
      __$$UserLocationImplCopyWithImpl<_$UserLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLocationImplToJson(
      this,
    );
  }
}

abstract class _UserLocation extends UserLocation {
  const factory _UserLocation(
      {@HiveField(0) required final String userId,
      @HiveField(1)
      @JsonKey(readValue: _UserLocationJson.readName)
      required final String name,
      @HiveField(2) required final List<VibeModel> vibes,
      @HiveField(3) required final double latitude,
      @HiveField(4) required final double longitude,
      @JsonKey(includeIfNull: false) final BitmapDescriptor? marker,
      @HiveField(5) required final bool isFriend}) = _$UserLocationImpl;
  const _UserLocation._() : super._();

  factory _UserLocation.fromJson(Map<String, dynamic> json) =
      _$UserLocationImpl.fromJson;

  @override
  @HiveField(0)
  String get userId;
  @override
  @HiveField(1)
  @JsonKey(readValue: _UserLocationJson.readName)
  String get name;
  @override
  @HiveField(2)
  List<VibeModel> get vibes;
  @override
  @HiveField(3)
  double get latitude;
  @override
  @HiveField(4)
  double get longitude;
  @override
  @JsonKey(includeIfNull: false)
  BitmapDescriptor? get marker;
  @override
  @HiveField(5)
  bool get isFriend;
  @override
  @JsonKey(ignore: true)
  _$$UserLocationImplCopyWith<_$UserLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
