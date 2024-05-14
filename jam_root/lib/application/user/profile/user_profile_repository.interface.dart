import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

abstract class UserProfileRepositoryInterface {
  abstract final UserProfileImagesRepositoryInterface images;
  abstract final SocialRepositoryInterface social;
  abstract final ProfileQueueInterface queue;

  Future<UserProfileModel> getCurrentUserProfile();
  Future<void> updateUserName({required String username});
  Future<void> updateProfileStatus({required String status});
  Future<void> updateOnlineStatus({required bool onlineStatus});
  Future<UserProfileModel> getUserProfileById({required String userId});
  Future<List<UserProfileModel>> getUsers({required List<String> userIds});
}
