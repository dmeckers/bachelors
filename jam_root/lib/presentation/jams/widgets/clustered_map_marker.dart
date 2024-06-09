import 'package:fluster/fluster.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClusteredMapMarker extends Clusterable {
  final String id;
  final LatLng position;
  BitmapDescriptor? icon;

  ClusteredMapMarker({
    required this.id,
    required this.position,
    this.icon,
    super.isCluster = false,
    super.clusterId,
    super.pointsSize,
    super.childMarkerId,
  }) : super(
          markerId: id,
          latitude: position.latitude,
          longitude: position.longitude,
        );

  Marker toMarker() => Marker(
        markerId: MarkerId(isCluster! ? 'cl_$id' : id),
        position: LatLng(
          position.latitude,
          position.longitude,
        ),
        icon: icon ?? BitmapDescriptor.defaultMarker,
      );
}
