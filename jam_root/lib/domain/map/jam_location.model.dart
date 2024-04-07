import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:jam/domain/domain.dart';

part 'jam_location.model.freezed.dart';
part 'jam_location.model.g.dart';

@freezed
class JamLocation with _$JamLocation implements LocationAbstactModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory JamLocation({
    required int jamId,
    required String name,
    required String description,
    required String locationName,
    required dynamic date,
    required double latitude,
    required double longitude,
    required List<VibeModel> vibes,
    required String creatorId,
    @JsonKey(includeIfNull: false) BitmapDescriptor? marker,
  }) = _JamLocation;

  factory JamLocation.fromJson(Map<String, dynamic> json) =>
      _$JamLocationFromJson(json);

  const JamLocation._();

  LatLng get toLatLng => LatLng(latitude, longitude);

  @override
  int get id => jamId;

  @override
  LocationType get type => LocationType.jam;
}
