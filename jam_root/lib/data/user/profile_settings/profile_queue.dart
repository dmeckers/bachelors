import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';

class ProfileQueue with SupabaseUserGetter implements ProfileQueueInterface {
  updateQuery({required String field}) {
    final userId = getUserIdOrThrow();

    return """
      UPDATE profiles
      SET $field = ?
      WHERE id = '$userId'
    """;
  }

  @override
  Future queueUpdateOnlineStatus({required bool isOnline}) {
    try {
      return PowerSync.db.execute(
        """
          UPDATE profiles
          SET is_online = ? , last_sign_in_at = ?
          WHERE id = '${getUserIdOrThrow()}'
      """,
        [isOnline, DateTime.now().toString()],
      );
    } catch (e) {
      return Future.value(null);
    }
  }

  @override
  Future queueUpdateProfileStatus({required String status}) =>
      PowerSync.db.execute(
        updateQuery(field: 'profile_status'),
        [status],
      );

  @override
  Future queueUpdateUserName({required String username}) =>
      PowerSync.db.execute(
        updateQuery(field: 'username'),
        [username],
      );
}

final profileQueueProvider = Provider<ProfileQueue>((ref) => ProfileQueue());
