import 'package:flutter_google_maps_webservices/places.dart' as places;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:jam/data/data.dart';
import 'package:jam_utils/jam_utils.dart';

class MapStateViewModel {
  final List<places.Prediction> placesSearchResults;
  final LatLng? selectedPlaceLocation;
  final GoogleMapController? googleMapsController;
  final bool showBottomSheet;
  final bool showPutJamBottomSheet;
  final LatLng? userCurrentLocation;

  MapStateViewModel({
    this.placesSearchResults = const [],
    this.selectedPlaceLocation,
    this.googleMapsController,
    this.showBottomSheet = false,
    this.showPutJamBottomSheet = false,
    this.userCurrentLocation,
  });

  factory MapStateViewModel.initial() {
    final cached = (localDatabase.get('LOCATION') as String?)?.extractCords();
    final coords = cached.isNotNull ? LatLng(cached!.lat, cached.lon) : null;
    return MapStateViewModel(userCurrentLocation: coords);
  }

  MapStateViewModel copyWith({
    List<places.Prediction>? placesSearchResults,
    LatLng? selectedPlaceLocation,
    GoogleMapController? googleMapsController,
    bool? showBottomSheet,
    bool? showPutJamBottomSheet,
    LatLng? userCurrentLocation,
  }) {
    return MapStateViewModel(
      placesSearchResults: placesSearchResults ?? this.placesSearchResults,
      selectedPlaceLocation:
          selectedPlaceLocation ?? this.selectedPlaceLocation,
      googleMapsController: googleMapsController ?? this.googleMapsController,
      showBottomSheet: showBottomSheet ?? this.showBottomSheet,
      showPutJamBottomSheet:
          showPutJamBottomSheet ?? this.showPutJamBottomSheet,
      userCurrentLocation: userCurrentLocation ?? this.userCurrentLocation,
    );
  }
}

// final userCurrentLocationProvider = StateProvider<LatLng?>((ref) {});
