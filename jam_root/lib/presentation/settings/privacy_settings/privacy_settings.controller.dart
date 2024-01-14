import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'privacy_settings.controller.g.dart';

@riverpod
Future<UserProfilePrivacySettingsModel> getPrivacySettings(
  GetPrivacySettingsRef ref,
) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);
  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .getCurrentUserPrivacySettings();
}

@riverpod
Future<void> updateMapVisibility(
  UpdateMapVisibilityRef ref, {
  required PrivacyBoundaries visibility,
}) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);

  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .updateMapVisibility(mapVisibility: visibility);
}

@riverpod
Future<void> updateAboutMeVisibility(
  UpdateAboutMeVisibilityRef ref, {
  required PrivacyBoundaries visibility,
}) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);

  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .updateAboutMeVisibility(aboutMeVisibility: visibility);
}

@riverpod
Future<void> updateCanBeInvitedToJams(
  UpdateCanBeInvitedToJamsRef ref, {
  required PrivacyBoundaries visibility,
}) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);

  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .updateCanBeInvitedToJams(canBeInvitedToJams: visibility);
}

@riverpod
Future<void> updateCanBeFoundByPhoneNumber(
  UpdateCanBeFoundByPhoneNumberRef ref, {
  required PrivacyBoundaries visibility,
}) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);

  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .updateCanBeFoundByPhoneNumber(foundByPhoneNumber: visibility);
}

@riverpod
Future<void> updatePhoneVisibility(
  UpdatePhoneVisibilityRef ref, {
  required PrivacyBoundaries visibility,
}) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);

  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .updatePhoneVisibility(phoneVisibility: visibility);
}

@riverpod
Future<void> updateCanBeInvitedToCommunities(
  UpdateCanBeInvitedToCommunitiesRef ref, {
  required PrivacyBoundaries visibility,
}) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);

  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .updateCanBeInvitedToCommunities(
        canBeInvitedToCommunities: visibility,
      );
}

@riverpod
Future<void> updateLastSeenVisibility(
  UpdateLastSeenVisibilityRef ref, {
  required PrivacyBoundaries visibility,
}) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);

  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .updateLastSeenVisibility(lastSeenVisibility: visibility);
}

@riverpod
Future<void> updateMapVisibilityWhiteList(
  UpdateMapVisibilityWhiteListRef ref, {
  required List<UserProfileModel> whiteList,
}) {
  final profileProviders = ref.read(profileRepositoryProvidersProvider);

  return ref
      .read(profileProviders.userPrivacyRepositoryProvider)
      .updateVisibleOnMapToUserList(whiteList: whiteList);
}
