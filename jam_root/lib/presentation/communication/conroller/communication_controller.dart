import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

part 'communication_controller.g.dart';

@riverpod
Future<FriendInvites> getFriendInvites(GetFriendInvitesRef ref) async {
  return await ref.read(socialRepositoryProvider).getFriendInvites();
}

@riverpod
Future<void> acceptFriendInvite(
  AcceptFriendInviteRef ref, {
  required String friendInviteId,
}) async {
  await ref
      .read(socialRepositoryProvider)
      .acceptFriendInvite(friendInviteId: friendInviteId);
}

@riverpod
Future<void> rejectFriendInvite(
  RejectFriendInviteRef ref, {
  required String friendInviteId,
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
