import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/domain/domain.dart';

part 'spot_jam_location.model.freezed.dart';

@freezed
class SpotJamLocation with _$SpotJamLocation implements LocationAbstactModel {
  const factory SpotJamLocation({
    required String id,
    required String name,
    required String description,
    required String locationName,
    required dynamic date,
    required double latitude,
    required double longitude,
    required List<VibeModel> vibes,
    required String creatorId,
    BitmapDescriptor? marker,
  }) = _SpotJamLocation;

  const SpotJamLocation._();

  factory SpotJamLocation.generate(
      {required String id,
      required double latitude,
      required double longitude,
      required BitmapDescriptor marker,
      String? locationName}) {
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
}
