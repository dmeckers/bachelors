import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/map/location.model.dart';
import 'package:jam/domain/vibes/vibe.model.dart';

part 'search_place_result.model.freezed.dart';
part 'search_place_result.model.g.dart';

@freezed
class SearchPlaceResult
    with _$SearchPlaceResult
    implements LocationAbstactModel {
  @HiveType(typeId: HiveConstants.PLACE_SEARCH_RESULT_LOCATION_MODEL_TYPE_ID)
  const factory SearchPlaceResult({
    @HiveField(0) @Default('places') String id,
    @HiveField(1) required String name,
    @HiveField(2) required double latitude,
    @HiveField(3) required double longitude,
    @HiveField(4) @Default([]) List<VibeModel> vibes,
    @HiveField(5) @Default('') String creatorId,
    @HiveField(6) @Default(LocationType.placeSearchResult) LocationType type,
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
