import 'package:fluster/fluster.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

part 'jam_location.model.freezed.dart';
part 'jam_location.model.g.dart';

@freezed
class JamLocation with _$JamLocation implements LocationAbstactModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  @HiveType(typeId: HiveConstants.JAM_LOCATION_MODEL_TYPE_ID)
  const factory JamLocation({
    @HiveField(0) required int jamId,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required String locationName,
    @HiveField(4) required dynamic date,
    @HiveField(5) required double latitude,
    @HiveField(6) required double longitude,
    @HiveField(7) required List<VibeModel> vibes,
    @HiveField(8) required String creatorId,
    @HiveField(9) required JamJoinTypeEnum joinType,
    @HiveField(10) String? creatorFcmToken,
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

  @override
  LocationAbstactModel copyWithResolvedMarker() => copyWith(
        marker: resolvedMarker,
      );

  BitmapDescriptor get resolvedMarker => marker.isNotNull
      ? marker!
      : supaAuth.currentUser!.id == creatorId
          ? JamMarker.getUserJamMarker()
          : JamMarker.getJamMarker();
}

abstract class TapableClusterable implements Clusterable {
  void Function()? onTap;
  Marker toMarker();
  Type get type;
}

class ClustarableJamLocation implements TapableClusterable {
  final JamLocation jamLocation;

  ClustarableJamLocation({
    required this.jamLocation,
    required this.isCluster,
    required this.clusterId,
    required this.pointsSize,
    required this.childMarkerId,
    required this.onTap,
  });

  @override
  Marker toMarker() => Marker(
        markerId: MarkerId('${jamLocation.jamId}'),
        position: LatLng(
          jamLocation.latitude,
          jamLocation.longitude,
        ),
        onTap: onTap,
        icon: jamLocation.resolvedMarker,
      );

  @override
  String? childMarkerId;

  @override
  int? clusterId;

  @override
  bool? isCluster;

  @override
  double? latitude;

  @override
  double? longitude;

  @override
  String? markerId;

  @override
  int? pointsSize;

  @override
  void Function()? onTap;

  @override
  Type get type => JamLocation;
}
