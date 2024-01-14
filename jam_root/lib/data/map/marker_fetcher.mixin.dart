import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/config/config.dart';

class JamMarker {
  static Uint8List _userMarkerBytes = Uint8List(0);
  static Uint8List _currentUserMarkerBytes = Uint8List(0);
  static Uint8List _friendsMarkerBytes = Uint8List(0);
  static Uint8List _jamMarkerBytes = Uint8List(0);
  static Uint8List _userJamMarkerBytes = Uint8List(0);

  static Future<void> initializeMarkers() async {
    ByteData jamMarkerAsset = await rootBundle.load(
      ImagePathConstants.MAP_JAM_MARKER_IMAGE_PATH,
    );

    ByteData userMarkerAsset = await rootBundle.load(
      ImagePathConstants.MAP_USER_MARKER_IMAGE_PATH,
    );

    ByteData currentUserMarkerAsset = await rootBundle.load(
      ImagePathConstants.MAP_CURRENT_USER_MARKER_IMAGE_PATH,
    );

    ByteData friendsMarkerAsset = await rootBundle.load(
      ImagePathConstants.MAP_FRIEND_MARKER_IMAGE_PATH,
    );

    ByteData userJamMarkerAsset = await rootBundle.load(
      ImagePathConstants.MAP_USERS_JAM_MARKER_IMAGE_PATH,
    );

    _userMarkerBytes = userMarkerAsset.buffer.asUint8List();
    _jamMarkerBytes = jamMarkerAsset.buffer.asUint8List();
    _currentUserMarkerBytes = currentUserMarkerAsset.buffer.asUint8List();
    _friendsMarkerBytes = friendsMarkerAsset.buffer.asUint8List();
    _userJamMarkerBytes = userJamMarkerAsset.buffer.asUint8List();
  }

  static BitmapDescriptor getUserMarker() {
    return BitmapDescriptor.fromBytes(_userMarkerBytes);
  }

  static BitmapDescriptor getCurrentUserMarker() {
    return BitmapDescriptor.fromBytes(_currentUserMarkerBytes);
  }

  static BitmapDescriptor getFriendsMarker() {
    return BitmapDescriptor.fromBytes(_friendsMarkerBytes);
  }

  static BitmapDescriptor getJamMarker() {
    return BitmapDescriptor.fromBytes(_jamMarkerBytes);
  }

  static BitmapDescriptor getUserJamMarker() {
    return BitmapDescriptor.fromBytes(_userJamMarkerBytes);
  }
}
