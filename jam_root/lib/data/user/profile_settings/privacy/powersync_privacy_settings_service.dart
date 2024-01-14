import 'package:flutter/foundation.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class PowerSyncPrivacySettingsService with SupabaseUserGetter {
  Future<PrivacySettings> getPrivacySettings() async {
    try {
      final userId = getUserIdOrThrow();
      final privacySettings = await PowerSync.db.get(
        PowerSyncPrivacyQueries.GET_PRIVACY_SETTINGS,
        [userId],
      );

      final mapWhiteList = await PowerSync.db.getAll(
        PowerSyncPrivacyQueries.GET_MAP_VIBISILITY_WHITELIST,
        [userId],
      );

      return PrivacySettings.fromJson(
        Json.of(privacySettings),
      ).copyWith(
        visibleOnMapToUserList: mapWhiteList
            .map(
              (e) => UserProfileModel.fromJson(
                Json.of(e).renameKeyWithValue(
                  oldKey: 'user_id',
                  newKey: 'id',
                  value: e['user_id'],
                ),
              ),
            )
            .toList(),
      );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

final powerSyncPrivacySettingsServiceProvider = Provider(
  (ref) => PowerSyncPrivacySettingsService(),
);
