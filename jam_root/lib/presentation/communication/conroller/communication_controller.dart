import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'communication_controller.g.dart';

@riverpod
Future<List<FriendInviteModel>> getFriendInvites(
    GetFriendInvitesRef ref) async {
  return await ref.read(socialRepositoryProvider).getFriendInvites();
}

@riverpod
Future<void> acceptFriendInvite(AcceptFriendInviteRef ref,
    {required String friendInviteId}) async {
  await ref
      .read(socialRepositoryProvider)
      .acceptFriendInvite(friendInviteId: friendInviteId);
}

@riverpod
Future<void> rejectFriendInvite(RejectFriendInviteRef ref,
    {required String friendInviteId}) async {
  await ref
      .read(socialRepositoryProvider)
      .rejectFriendInvite(friendInviteId: friendInviteId);
}

@riverpod
Future<List<UserProfileModel>> getFriends(GetFriendsRef ref) async {
  return await ref.read(socialRepositoryProvider).getFriends();
}

// @riverpod
// Stream<List<ChatModel>> getChats(GetChatsRef ref) {
//   return ref.read(chatRepositoryProvider).getChats$();
// }
