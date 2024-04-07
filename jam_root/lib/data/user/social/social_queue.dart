import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';

class SocialQueue with SupabaseUserGetter implements SocialQueueInterface {
  @override
  Future<void> queueAcceptFriendInvite({required String friendInviteId}) {
    return PowerSync.db.execute(
      'UPDATE friend_invites SET status = ? WHERE id = ?',
      ['accepted', friendInviteId],
    );
  }

  @override
  Future<void> queueRejectFriendInvite({required String friendInviteId}) {
    return PowerSync.db.execute(
      'DELETE FROM friend_invites WHERE id = ?',
      [friendInviteId],
    );
  }

  @override
  Future<bool> queueSendFriendInvite({required String userId}) async {
    try {
      await PowerSync.db.execute(
        'INSERT INTO friend_invites (user_sent , user_received) VALUES (?,?)',
        [getUserIdOrThrow(), userId],
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> queueAcceptJamInvite({required int jamInviteId}) {
    return PowerSync.db.execute(
      'UPDATE jam_invites SET status = ? WHERE id = ?',
      ['accepted', jamInviteId],
    );
  }

  @override
  Future<void> queueRejectJamInvite({required int jamInviteId}) {
    return PowerSync.db.execute(
      'DELETE FROM jam_invites WHERE id = ?',
      [jamInviteId],
    );
  }

  @override
  Future<bool> queueSendJamInvite({
    required Strings userIds,
    required int jamId,
  }) async {
    try {
      final invitingUserId = getUserIdOrThrow();
      await PowerSync.db.executeBatch(
        'INSERT INTO jam_invites (user_sent , user_received , jam_id) VALUES (?,?,?)',
        userIds.map((userId) => [invitingUserId, userId, jamId]).toList(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

final socialQueueProvider = Provider<SocialQueueInterface>(
  (ref) => SocialQueue(),
);
