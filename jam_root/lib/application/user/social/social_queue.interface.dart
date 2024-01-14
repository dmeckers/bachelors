abstract class SocialQueueInterface {
  Future<bool> queueSendFriendInvite({required String userId});
  Future<void> queueAcceptFriendInvite({required String friendInviteId});
  Future<void> queueRejectFriendInvite({required String friendInviteId});
  Future<bool> queueSendJamInvite({
    required List<String> userIds,
    required int jamId,
  });
  Future<void> queueAcceptJamInvite({required int jamInviteId});
  Future<void> queueRejectJamInvite({required int jamInviteId});
}
