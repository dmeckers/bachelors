import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class PowerSyncSocialService with SupabaseUserGetter {
  Future<bool> checkInviteSent({required String userId}) async {
    final row = await PowerSync.db.get(
      PowerSyncSocialQueries.CHECK_FRIEND_INVITE_SENT_SQL,
      [getUserIdOrThrow(), userId],
    );

    return row.isNotEmpty;
  }

  Future<FriendInvites> getFriendInvites() async {
    final rows = await PowerSync.db.getAll(
      PowerSyncSocialQueries.GET_FRIEND_INVITES,
      [getUserIdOrThrow()],
    );
    try {
      return rows.map((e) => FriendInviteModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Users> getFriends() async {
    final rows = await PowerSync.db.getAll(
      PowerSyncSocialQueries.GET_FRIENDS(getUserIdOrThrow()),
      [],
    );

    try {
      return rows.map((e) => UserProfileModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<JamInvites> getJamInvites() async {
    final rows = await PowerSync.db.getAll(
      PowerSyncSocialQueries.GET_JAM_INVITES,
      [getUserIdOrThrow()],
    );

    try {
      return rows.map((e) => JamInviteModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<JamInvites> getSentJamInvites() async {
    final rows = await PowerSync.db.getAll(
      PowerSyncSocialQueries.GET_SENT_JAM_INVITES,
      [getUserIdOrThrow()],
    );

    try {
      return rows.map((e) => JamInviteModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

final powerSyncSocialServiceProvider = Provider<PowerSyncSocialService>(
  (ref) => PowerSyncSocialService(),
);
