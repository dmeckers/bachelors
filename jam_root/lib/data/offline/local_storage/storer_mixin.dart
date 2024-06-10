import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:location/location.dart';
import 'package:jam_utils/jam_utils.dart';

mixin class Storer {
  static const Map<Type, String> _typeKeys = {
    UserProfileModel: HiveConstants.LOCAL_DB_USER_PROFILE_KEY,
    FriendInviteModel: HiveConstants.LOCAL_DB_FRIEND_INVITES_KEY,
    List<ChatModel>: HiveConstants.LOCAL_DB_CHAT_KEY,
    Map<int, ChatState>: HiveConstants.LOCAL_DB_CHAT_STATE_KEY,
    UserProfilePrivacySettingsModel:
        HiveConstants.LOCAL_DB_USER_PRIVACY_SETTINGS_KEY,
    JamCardView: HiveConstants.LOCAL_DB_JAM_CARD_VIEW_KEY,
    MapData: HiveConstants.LOCAL_DB_LAST_CACHED_MAP_DATA_KEY,
  };

  Future<void> hivePut<T>(T value) async {
    await localDatabase.put(_typeKeys[T], value);
  }

  Future<T> hivePutAndReturn<T>(T value) async {
    await hivePut<T>(value);
    return value;
  }

  T? hiveGet<T>() {
    final data = localDatabase.get(_typeKeys[T]);
    return data is List ? data.cast<T?>().toList() : data;
  }

  void hiveRemove<T>() {
    localDatabase.delete(_typeKeys[T]);
  }

  Future<bool> hiveRefresh<T>(T value) async {
    hiveRemove<T>();
    await hivePut<T>(value);
    return true;
  }

  Future<T> hiveRefreshAndReturn<T>(T value) async {
    await hiveRefresh<T>(value);
    return value;
  }

  static Future<void> hiveCacheLocation({required LocationData data}) async {
    await localDatabase.put(
      'LOCATION',
      GeoPacker.toLatLngStringFromData(data: data),
    );
  }

  static LatLng? hiveGetLocation() {
    final cached = (localDatabase.get('LOCATION') as String?)?.extractCords();

    if (cached.isNull) return null;

    return LatLng(cached!.lat, cached.lon);
  }
}

final storerProvider = Provider((ref) => Storer());
