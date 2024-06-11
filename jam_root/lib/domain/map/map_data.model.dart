import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jam/config/config.dart';

import 'package:jam/domain/domain.dart';

part 'map_data.model.freezed.dart';
part 'map_data.model.g.dart';

@freezed
class MapData with _$MapData {
  @HiveType(typeId: HiveConstants.LAST_CACHED_MAP_DATA_TYPE_ID)
  const factory MapData({
    @HiveField(0) required LatLng currentPosition,
    @HiveField(1) required List<LocationAbstactModel> locations,
    @HiveField(2) LocationAbstactModel? focusedLocationPoint,
    @HiveField(3) LocationAbstactModel? searchedPlaceLocation,
  }) = _MapData;

  const MapData._();

  MapData withoutFocusedLocationPoint() => MapData(
        currentPosition: currentPosition,
        locations: locations,
        focusedLocationPoint: null,
      );

  MapData withoutSearchedPlaceLocation() => MapData(
        currentPosition: currentPosition,
        locations: locations,
        searchedPlaceLocation: null,
      );
}

@HiveType(
  typeId: HiveConstants.LAT_LNG_ADAPTER_TYPE_ID,
)
class LatLngAdapter extends TypeAdapter<LatLng> {
  @override
  LatLng read(BinaryReader reader) {
    final lat = reader.readDouble();
    final lng = reader.readDouble();
    return LatLng(lat, lng);
  }

  @override
  void write(BinaryWriter writer, LatLng obj) {
    writer.writeDouble(obj.latitude);
    writer.writeDouble(obj.longitude);
  }

  @override
  int get typeId => HiveConstants.LAT_LNG_ADAPTER_TYPE_ID;
}
