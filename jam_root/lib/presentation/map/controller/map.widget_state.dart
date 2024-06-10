import 'package:flutter_google_maps_webservices/places.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/domain/domain.dart';

part 'map.widget_state.freezed.dart';

@freezed
class MapWidgetState with _$MapWidgetState {
  const factory MapWidgetState({
    @Default([]) List<Prediction> placesSearchResults,
    GoogleMapController? googleMapsController,
    @Default(false) bool showBottomSheet,
    LatLng? selectedPlaceLocation,
    required MapData mapData,
  }) = _MapWidgetState;
}
