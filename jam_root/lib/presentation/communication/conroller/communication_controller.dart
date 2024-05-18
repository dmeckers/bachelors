import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jam/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'communication_controller.g.dart';

@riverpod
Stream<FriendInvites> getFriendInvites(GetFriendInvitesRef ref) async* {
  final userId = supaAuth.currentUser!.id;

  final controller = BehaviorSubject<FriendInvites>.seeded([]);
  final getInvites = ref.read(socialRepositoryProvider).getFriendInvites;

  controller.value = await getInvites();

  yield controller.value;

  supabase
      .channel('$userId-friend-invites')
      .onPostgresChanges(
        table: 'friend_invites',
        event: PostgresChangeEvent.insert,
        callback: (data) async {
          controller.value = await getInvites();
        },
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'user_received',
          value: userId,
        ),
      )
      .onPostgresChanges(
        event: PostgresChangeEvent.delete,
        table: 'friend_invites',
        callback: (data) {
          controller.value = controller.value
              .where((e) => e.id != data.oldRecord['id'])
              .toList();
        },
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'user_received',
          value: userId,
        ),
      )
      .subscribe(
    (r, _) {
      debugPrint(r.toString());
    },
  );

  yield* controller.stream;
}

@riverpod
Future<void> acceptFriendInvite(
  AcceptFriendInviteRef ref, {
  required int friendInviteId,
}) async {
  await ref
      .read(socialRepositoryProvider)
      .acceptFriendInvite(friendInviteId: friendInviteId);
}

@riverpod
Future<void> rejectFriendInvite(
  RejectFriendInviteRef ref, {
  required int friendInviteId,
}) async {
  await ref
      .read(socialRepositoryProvider)
      .rejectFriendInvite(friendInviteId: friendInviteId);
}

@riverpod
Stream<List<UserProfileModel>> getFriends(GetFriendsRef ref) async* {
  final storer = ref.read(storerProvider);
  final user = storer.get<UserProfileModel>();
  yield user!.friends;
  final friends = await ref.read(socialRepositoryProvider).getFriends();
  await storer.refresh<UserProfileModel>(user.copyWith(friends: friends));
  yield friends;
}
