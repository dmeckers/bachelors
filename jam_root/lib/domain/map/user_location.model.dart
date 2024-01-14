import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/domain/domain.dart';

part 'user_location.model.g.dart';
part 'user_location.model.freezed.dart';

@freezed
class UserLocation with _$UserLocation implements LocationAbstactModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserLocation({
    required String userId,
    required String name,
    required List<VibeModel> vibes,
    required double latitude,
    required double longitude,
    @JsonKey(includeIfNull: false) BitmapDescriptor? marker,
    required bool isFriend,
  }) = _UserLocation;

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);

  LatLng get toLatLng => LatLng(latitude, longitude);

  const UserLocation._();

  @override
  String get id => userId;

  @override
  LocationType get type => LocationType.user;
}
