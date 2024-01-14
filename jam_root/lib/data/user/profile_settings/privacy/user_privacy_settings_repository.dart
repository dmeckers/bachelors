import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final class UserPrivacySettingsRepository
    extends UserPrivacySettingsRepositoryInterface with SupabaseUserGetter {
  @override
  final PrivacySettingsQueueInterface privacyQueue;

  final ProviderRef _ref;

  UserPrivacySettingsRepository(
    this._ref,
    this.privacyQueue,
  );

  @override
  Future<PrivacySettings> getCurrentUserPrivacySettings() =>
      _ref.read(powerSyncPrivacySettingsServiceProvider).getPrivacySettings();

  @override
  Future<void> updateVisibleOnMapToUserList({required Users whiteList}) =>
      privacyQueue.updateVisibleOnMapToUserList(whiteList: whiteList);

  @override
  Future<void> updateMapVisibility({
    required PrivacyBoundaries mapVisibility,
  }) =>
      privacyQueue.updateMapVisibility(
        mapVisibility: mapVisibility,
      );

  @override
  Future<void> updateAboutMeVisibility({
    required PrivacyBoundaries aboutMeVisibility,
  }) =>
      privacyQueue.updateAboutMeVisibility(
        aboutMeVisibility: aboutMeVisibility,
      );

  @override
  Future<void> updateCanBeInvitedToJams({
    required PrivacyBoundaries canBeInvitedToJams,
  }) =>
      privacyQueue.updateCanBeInvitedToJams(
        canBeInvitedToJams: canBeInvitedToJams,
      );

  @override
  Future<void> updateCanBeFoundByPhoneNumber({
    required PrivacyBoundaries foundByPhoneNumber,
  }) =>
      privacyQueue.updateCanBeFoundByPhoneNumber(
        foundByPhoneNumber: foundByPhoneNumber,
      );

  @override
  Future<void> updatePhoneVisibility({
    required PrivacyBoundaries phoneVisibility,
  }) =>
      privacyQueue.updatePhoneVisibility(
        phoneVisibility: phoneVisibility,
      );

  @override
  Future<void> updateCanBeInvitedToCommunities({
    required PrivacyBoundaries canBeInvitedToCommunities,
  }) =>
      privacyQueue.updateCanBeInvitedToCommunities(
        canBeInvitedToCommunities: canBeInvitedToCommunities,
      );

  @override
  Future<void> updateLastSeenVisibility({
    required PrivacyBoundaries lastSeenVisibility,
  }) =>
      privacyQueue.updateLastSeenVisibility(
        lastSeenVisibility: lastSeenVisibility,
      );

  @override
  Future<void> removeUserFromMapVisibilityWhiteList({required String userId}) =>
      privacyQueue.removeUserFromMapVisibilityWhiteList(userId: userId);

  @override
  Future<void> removeUserAboutMeVisibilityWhiteList({required String userId}) =>
      privacyQueue.removeUserAboutMeVisibilityWhiteList(userId: userId);

  @override
  Future<void> removeUserCanBeInvitedToJamWhiteList({required String userId}) =>
      privacyQueue.removeUserCanBeInvitedToJamWhiteList(userId: userId);

  @override
  Future<void> removeUserInvitableToCommunitiesUserList({
    required String userId,
  }) =>
      privacyQueue.removeUserInvitableToCommunitiesUserList(userId: userId);

  @override
  Future<void> removeUserPhoneVisibilityWhiteList({required String userId}) =>
      privacyQueue.removeUserPhoneVisibilityWhiteList(userId: userId);

  @override
  Future<void> updateAboutMeVisibilityWhiteList({required Users whiteList}) =>
      privacyQueue.updateAboutMeVisibilityWhiteList(whiteList: whiteList);

  @override
  Future<void> updateCanBeInvitedToJamWhiteList({required Users whiteList}) =>
      privacyQueue.updateCanBeInvitedToJamWhiteList(whiteList: whiteList);

  @override
  Future<void> updateInvitableToCommunitiesUserList({
    required Users whiteList,
  }) =>
      privacyQueue.updateInvitableToCommunitiesUserList(whiteList: whiteList);

  @override
  Future<void> updatePhoneVisibilityWhiteList({required Users whiteList}) =>
      privacyQueue.updatePhoneVisibilityWhiteList(whiteList: whiteList);
}
