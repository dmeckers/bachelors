import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';

import 'package:jam/domain/domain.dart';

part 'user_location.model.g.dart';
part 'user_location.model.freezed.dart';

@freezed
class UserLocation with _$UserLocation implements LocationAbstactModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  @HiveType(typeId: HiveConstants.USER_LOCATION_MODEL_TYPE_ID)
  const factory UserLocation({
    @HiveField(0) required String userId,
    @HiveField(1)
    @JsonKey(readValue: _UserLocationJson.readName)
    required String name,
    @HiveField(2) required List<VibeModel> vibes,
    @HiveField(3) required double latitude,
    @HiveField(4) required double longitude,
    @JsonKey(includeIfNull: false) BitmapDescriptor? marker,
    @HiveField(5) required bool isFriend,
  }) = _UserLocation;

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);

  LatLng get toLatLng => LatLng(latitude, longitude);

  const UserLocation._();

  @override
  String get id => userId;

  @override
  LocationType get type => LocationType.user;

  @override
  LocationAbstactModel copyWithResolvedMarker() => copyWith(
        marker: resolvedMarker,
      );

  BitmapDescriptor get resolvedMarker =>
      marker ??
      (isFriend ? JamMarker.getFriendsMarker() : JamMarker.getUserMarker());
}

final class _UserLocationJson {
  static Object? readName(json, key) => json['full_name'];
}

class ClustarableUserLocation implements TapableClusterable {
  final UserLocation userLocation;

  ClustarableUserLocation({
    required this.userLocation,
    this.isCluster = false,
    this.clusterId,
    this.pointsSize,
    this.childMarkerId,
  });

  @override
  Marker toMarker() => Marker(
        markerId: MarkerId(userLocation.id),
        position: LatLng(
          userLocation.latitude,
          userLocation.longitude,
        ),
        onTap: onTap,
        icon: userLocation.resolvedMarker,
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
  void Function()? onTap;

  @override
  int? pointsSize;

  @override
  Type get type => UserLocation;
}
