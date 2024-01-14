import 'package:jam/domain/domain.dart';

abstract class PrivacySettingsQueueInterface {
  Future<void> updateCanBeFoundByPhoneNumber({
    required PrivacyBoundaries foundByPhoneNumber,
  });
  Future<void> updateCanBeInvitedToCommunities({
    required PrivacyBoundaries canBeInvitedToCommunities,
  });

  Future<void> updateCanBeInvitedToJams({
    required PrivacyBoundaries canBeInvitedToJams,
  });
  Future<void> updateAboutMeVisibility({
    required PrivacyBoundaries aboutMeVisibility,
  });
  Future<void> updatePhoneVisibility({
    required PrivacyBoundaries phoneVisibility,
  });
  Future<void> updateMapVisibility({
    required PrivacyBoundaries mapVisibility,
  });
  Future<void> updateLastSeenVisibility({
    required PrivacyBoundaries lastSeenVisibility,
  });

  // #endregion

  // #region white list methods

  Future<void> updateCanBeInvitedToJamWhiteList({
    required List<UserProfileModel> whiteList,
  });

  Future<void> updateAboutMeVisibilityWhiteList({
    required List<UserProfileModel> whiteList,
  });

  Future<void> updatePhoneVisibilityWhiteList({
    required List<UserProfileModel> whiteList,
  });
  Future<void> updateInvitableToCommunitiesUserList({
    required List<UserProfileModel> whiteList,
  });

  Future<void> updateVisibleOnMapToUserList({
    required List<UserProfileModel> whiteList,
  });

  Future<void> removeUserFromMapVisibilityWhiteList({
    required String userId,
  });

  Future<void> removeUserCanBeInvitedToJamWhiteList({
    required String userId,
  });
  Future<void> removeUserAboutMeVisibilityWhiteList({
    required String userId,
  });
  Future<void> removeUserPhoneVisibilityWhiteList({
    required String userId,
  });
  Future<void> removeUserInvitableToCommunitiesUserList({
    required String userId,
  });
}
