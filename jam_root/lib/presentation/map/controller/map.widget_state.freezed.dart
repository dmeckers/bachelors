// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map.widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapWidgetState {
  List<Prediction> get placesSearchResults =>
      throw _privateConstructorUsedError;
  GoogleMapController? get googleMapsController =>
      throw _privateConstructorUsedError;
  bool get showBottomSheet => throw _privateConstructorUsedError;
  LatLng? get selectedPlaceLocation => throw _privateConstructorUsedError;
  MapData get mapData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapWidgetStateCopyWith<MapWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapWidgetStateCopyWith<$Res> {
  factory $MapWidgetStateCopyWith(
          MapWidgetState value, $Res Function(MapWidgetState) then) =
      _$MapWidgetStateCopyWithImpl<$Res, MapWidgetState>;
  @useResult
  $Res call(
      {List<Prediction> placesSearchResults,
      GoogleMapController? googleMapsController,
      bool showBottomSheet,
      LatLng? selectedPlaceLocation,
      MapData mapData});

  $MapDataCopyWith<$Res> get mapData;
}

/// @nodoc
class _$MapWidgetStateCopyWithImpl<$Res, $Val extends MapWidgetState>
    implements $MapWidgetStateCopyWith<$Res> {
  _$MapWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placesSearchResults = null,
    Object? googleMapsController = freezed,
    Object? showBottomSheet = null,
    Object? selectedPlaceLocation = freezed,
    Object? mapData = null,
  }) {
    return _then(_value.copyWith(
      placesSearchResults: null == placesSearchResults
          ? _value.placesSearchResults
          : placesSearchResults // ignore: cast_nullable_to_non_nullable
              as List<Prediction>,
      googleMapsController: freezed == googleMapsController
          ? _value.googleMapsController
          : googleMapsController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      showBottomSheet: null == showBottomSheet
          ? _value.showBottomSheet
          : showBottomSheet // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPlaceLocation: freezed == selectedPlaceLocation
          ? _value.selectedPlaceLocation
          : selectedPlaceLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      mapData: null == mapData
          ? _value.mapData
          : mapData // ignore: cast_nullable_to_non_nullable
              as MapData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MapDataCopyWith<$Res> get mapData {
    return $MapDataCopyWith<$Res>(_value.mapData, (value) {
      return _then(_value.copyWith(mapData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MapWidgetStateImplCopyWith<$Res>
    implements $MapWidgetStateCopyWith<$Res> {
  factory _$$MapWidgetStateImplCopyWith(_$MapWidgetStateImpl value,
          $Res Function(_$MapWidgetStateImpl) then) =
      __$$MapWidgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Prediction> placesSearchResults,
      GoogleMapController? googleMapsController,
      bool showBottomSheet,
      LatLng? selectedPlaceLocation,
      MapData mapData});

  @override
  $MapDataCopyWith<$Res> get mapData;
}

/// @nodoc
class __$$MapWidgetStateImplCopyWithImpl<$Res>
    extends _$MapWidgetStateCopyWithImpl<$Res, _$MapWidgetStateImpl>
    implements _$$MapWidgetStateImplCopyWith<$Res> {
  __$$MapWidgetStateImplCopyWithImpl(
      _$MapWidgetStateImpl _value, $Res Function(_$MapWidgetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placesSearchResults = null,
    Object? googleMapsController = freezed,
    Object? showBottomSheet = null,
    Object? selectedPlaceLocation = freezed,
    Object? mapData = null,
  }) {
    return _then(_$MapWidgetStateImpl(
      placesSearchResults: null == placesSearchResults
          ? _value._placesSearchResults
          : placesSearchResults // ignore: cast_nullable_to_non_nullable
              as List<Prediction>,
      googleMapsController: freezed == googleMapsController
          ? _value.googleMapsController
          : googleMapsController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      showBottomSheet: null == showBottomSheet
          ? _value.showBottomSheet
          : showBottomSheet // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPlaceLocation: freezed == selectedPlaceLocation
          ? _value.selectedPlaceLocation
          : selectedPlaceLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      mapData: null == mapData
          ? _value.mapData
          : mapData // ignore: cast_nullable_to_non_nullable
              as MapData,
    ));
  }
}

/// @nodoc

class _$MapWidgetStateImpl implements _MapWidgetState {
  const _$MapWidgetStateImpl(
      {final List<Prediction> placesSearchResults = const [],
      this.googleMapsController,
      this.showBottomSheet = false,
      this.selectedPlaceLocation,
      required this.mapData})
      : _placesSearchResults = placesSearchResults;

  final List<Prediction> _placesSearchResults;
  @override
  @JsonKey()
  List<Prediction> get placesSearchResults {
    if (_placesSearchResults is EqualUnmodifiableListView)
      return _placesSearchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placesSearchResults);
  }

  @override
  final GoogleMapController? googleMapsController;
  @override
  @JsonKey()
  final bool showBottomSheet;
  @override
  final LatLng? selectedPlaceLocation;
  @override
  final MapData mapData;

  @override
  String toString() {
    return 'MapWidgetState(placesSearchResults: $placesSearchResults, googleMapsController: $googleMapsController, showBottomSheet: $showBottomSheet, selectedPlaceLocation: $selectedPlaceLocation, mapData: $mapData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapWidgetStateImpl &&
            const DeepCollectionEquality()
                .equals(other._placesSearchResults, _placesSearchResults) &&
            (identical(other.googleMapsController, googleMapsController) ||
                other.googleMapsController == googleMapsController) &&
            (identical(other.showBottomSheet, showBottomSheet) ||
                other.showBottomSheet == showBottomSheet) &&
            (identical(other.selectedPlaceLocation, selectedPlaceLocation) ||
                other.selectedPlaceLocation == selectedPlaceLocation) &&
            (identical(other.mapData, mapData) || other.mapData == mapData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_placesSearchResults),
      googleMapsController,
      showBottomSheet,
      selectedPlaceLocation,
      mapData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapWidgetStateImplCopyWith<_$MapWidgetStateImpl> get copyWith =>
      __$$MapWidgetStateImplCopyWithImpl<_$MapWidgetStateImpl>(
          this, _$identity);
}

abstract class _MapWidgetState implements MapWidgetState {
  const factory _MapWidgetState(
      {final List<Prediction> placesSearchResults,
      final GoogleMapController? googleMapsController,
      final bool showBottomSheet,
      final LatLng? selectedPlaceLocation,
      required final MapData mapData}) = _$MapWidgetStateImpl;

  @override
  List<Prediction> get placesSearchResults;
  @override
  GoogleMapController? get googleMapsController;
  @override
  bool get showBottomSheet;
  @override
  LatLng? get selectedPlaceLocation;
  @override
  MapData get mapData;
  @override
  @JsonKey(ignore: true)
  _$$MapWidgetStateImplCopyWith<_$MapWidgetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
