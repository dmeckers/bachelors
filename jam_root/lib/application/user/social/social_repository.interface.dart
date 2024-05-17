import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

typedef UserWithRelationshipStatus = ({
  RelationshipStatus status,
  UserProfileModel user
});

abstract class SocialRepositoryInterface {
  Future<UserWithRelationshipStatus> getRelationshipStatus({
    required String userId,
  });

  Future<bool> sendFriendInvite({required String userId});

  Future<List<FriendInviteModel>> getFriendInvites();

  Future<void> acceptFriendInvite({required String friendInviteId});

  Future<void> rejectFriendInvite({required String friendInviteId});

  Future<List<UserProfileModel>> getFriends();

  Future<void> sendJamInvite({
    required int jamId,
    required List<String> userIds,
  });

  Future<List<JamInviteModel>> getJamInvites();

  Future<List<JamInviteModel>> getSentJamInvites();

  Future<List<FriendInviteModel>> getSentFriendInvites();

  Future<void> acceptJamInvite({required int inviteId});

  Future<void> rejectJamInvite({required int inviteId});

  abstract final SocialQueueInterface queue;
}
