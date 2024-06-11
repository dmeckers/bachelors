import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:jam/config/constants/hive.config.dart';
import 'package:jam/domain/domain.dart';

part 'spot_jam_location.model.freezed.dart';
part 'spot_jam_location.model.g.dart';

@freezed
class SpotJamLocation with _$SpotJamLocation implements LocationAbstactModel {
  @HiveType(typeId: HiveConstants.SPOT_JAM_LOCATION_MODEL_TYPE_ID)
  const factory SpotJamLocation({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required String locationName,
    @HiveField(4) required DateTime date,
    @HiveField(5) required double latitude,
    @HiveField(6) required double longitude,
    @HiveField(7) required List<VibeModel> vibes,
    @HiveField(8) required String creatorId,
    BitmapDescriptor? marker,
  }) = _SpotJamLocation;

  const SpotJamLocation._();

  factory SpotJamLocation.generate({
    required String id,
    required double latitude,
    required double longitude,
    required BitmapDescriptor marker,
    String? locationName,
  }) {
    return SpotJamLocation(
      id: id,
      name: '',
      description: '',
      locationName: locationName ?? 'New jam here?',
      date: DateTime.now(),
      latitude: latitude,
      longitude: longitude,
      vibes: [],
      creatorId: '',
      marker: marker,
    );
  }

  factory SpotJamLocation.dummy() {
    return SpotJamLocation(
      id: '1',
      name: 'Jam',
      description: 'Jam',
      locationName: 'Jam',
      date: DateTime.now(),
      latitude: 0,
      longitude: 0,
      vibes: [],
      creatorId: '1',
      marker: BitmapDescriptor.defaultMarkerWithHue(0),
    );
  }

  LatLng get toLatLng => LatLng(latitude, longitude);

  @override
  LocationType get type => LocationType.spottedJam;

  @override
  LocationAbstactModel copyWithResolvedMarker() => copyWith(marker: marker);
}
