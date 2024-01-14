abstract class ProfileQueueInterface {
  Future queueUpdateUserName({required String username});
  Future queueUpdateProfileStatus({required String status});
  Future queueUpdateOnlineStatus({required bool isOnline});
}
