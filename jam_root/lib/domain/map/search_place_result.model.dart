import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/domain/map/location.model.dart';
import 'package:jam/domain/vibes/vibe.model.dart';

part 'search_place_result.model.freezed.dart';

@freezed
class SearchPlaceResult
    with _$SearchPlaceResult
    implements LocationAbstactModel {
  const factory SearchPlaceResult({
    @Default('places') String id,
    required String name,
    required double latitude,
    required double longitude,
    @Default([]) List<VibeModel> vibes,
    @Default('') String creatorId,
    @Default(LocationType.placeSearchResult) LocationType type,
    BitmapDescriptor? marker,
  }) = _SearchPlaceResult;

  const SearchPlaceResult._();

  @override
  LocationAbstactModel copyWithResolvedMarker() => this;

  factory SearchPlaceResult.generate({
    required double latitude,
    required double longitude,
    required String locationName,
  }) =>
      SearchPlaceResult(
        name: locationName,
        latitude: latitude,
        longitude: longitude,
        vibes: [],
        creatorId: '',
        marker: BitmapDescriptor.defaultMarkerWithHue(0),
      );
}
