import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

class PowerSyncUserProfileService {
  Future<String> getUserNameByUserId({required String userId}) async {
    final row = await PowerSync.db.get(
      PowerSyncProfileQueries.GET_USERNAME_BY_USER_ID,
      [userId],
    );

    return row['username'] as String;
  }

  ///
  /// 2 queries because sqlite doesn't support array types
  ///
  Future<UserProfileModel> getUserProfileById({required String userId}) async {
    try {
      final userRow = await PowerSync.db.get(
        PowerSyncProfileQueries.GET_USER_PROFILE,
        [userId],
      );

      final vibesRow = await PowerSync.db.getAll(
        PowerSyncVibesQueries.GET_USER_VIBES,
        [userId],
      );

      final profile = UserProfileModel.fromJson(
        Json.of(userRow).replaceKeyValue(
          key: 'is_online',
          value: userRow['is_online'] == 1,
        ),
      );
      final vibes = vibesRow
          .map(
            (row) => PowerSyncRowParser.parseVibes(row),
          )
          .toList();
      return profile.copyWith(vibes: vibes);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

final powersyncUserProfileServiceProvider =
    Provider<PowerSyncUserProfileService>(
  (ref) => PowerSyncUserProfileService(),
);
