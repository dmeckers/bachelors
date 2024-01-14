import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/user/profile_settings/privacy/privacy_boundaries.enum.dart';

class PrivacySettingsQueue
    with SupabaseUserGetter
    implements PrivacySettingsQueueInterface {
  updateWhiteList({
    required String table,
    required Users users,
  }) async {
    final userId = getUserIdOrThrow();

    await PowerSync.db.execute(
      PowerSyncPrivacyQueries.clearWhiteList(table: table, userId: userId),
    );

    await PowerSync.db.executeBatch(
      PowerSyncPrivacyQueries.insertIntoWhiteList(table: table, userId: userId),
      users.map((user) => [user.id]).toList(),
    );
  }

  updateVisiblity({
    required String column,
    required PrivacyBoundaries visibility,
  }) =>
      PowerSync.db.execute(
        PowerSyncPrivacyQueries.updateVisiblity(column: column),
        [
          visibility.name,
          getUserIdOrThrow(),
        ],
      );

  removeFromWhiteList({
    required String table,
    required String userId,
  }) =>
      PowerSync.db.execute(
        PowerSyncPrivacyQueries.removeFromWhiteList(table: table),
        [
          getUserIdOrThrow(),
          userId,
        ],
      );

  @override
  Future<void> removeUserAboutMeVisibilityWhiteList({
    required String userId,
  }) =>
      removeFromWhiteList(
        table: PrivacyTables.ABOUT_ME_VISIBILITY_WHITELIST,
        userId: userId,
      );

  @override
  Future<void> removeUserCanBeInvitedToJamWhiteList({
    required String userId,
  }) =>
      removeFromWhiteList(
        table: PrivacyTables.CAN_BE_INVITED_TO_JAM_WHITELIST,
        userId: userId,
      );

  @override
  Future<void> removeUserFromMapVisibilityWhiteList({
    required String userId,
  }) =>
      removeFromWhiteList(
        table: PrivacyTables.MAP_VISIBILITY_WHITELIST,
        userId: userId,
      );

  @override
  Future<void> removeUserInvitableToCommunitiesUserList({
    required String userId,
  }) =>
      removeFromWhiteList(
        table: PrivacyTables.CAN_BE_INVITED_TO_COMMUNITIES_WHITELIST,
        userId: userId,
      );

  @override
  Future<void> removeUserPhoneVisibilityWhiteList({
    required String userId,
  }) =>
      removeFromWhiteList(
        table: PrivacyTables.PHONE_VISIBILITY_WHITELIST,
        userId: userId,
      );

  @override
  Future<void> updateAboutMeVisibility({
    required PrivacyBoundaries aboutMeVisibility,
  }) =>
      updateVisiblity(
        column: PrivacyTables.ABOUT_ME_VISIBILITY,
        visibility: aboutMeVisibility,
      );

  @override
  Future<void> updateAboutMeVisibilityWhiteList({
    required Users whiteList,
  }) =>
      updateWhiteList(
        table: PrivacyTables.ABOUT_ME_VISIBILITY_WHITELIST,
        users: whiteList,
      );

  @override
  Future<void> updateCanBeFoundByPhoneNumber({
    required PrivacyBoundaries foundByPhoneNumber,
  }) =>
      updateVisiblity(
        column: PrivacyTables.CAN_BE_FOUND_BY_PHONE,
        visibility: foundByPhoneNumber,
      );

  @override
  Future<void> updateCanBeInvitedToCommunities({
    required PrivacyBoundaries canBeInvitedToCommunities,
  }) =>
      updateVisiblity(
        column: PrivacyTables.CAN_BE_INVITED_TO_COMMUNITIES,
        visibility: canBeInvitedToCommunities,
      );

  @override
  Future<void> updateCanBeInvitedToJamWhiteList({
    required Users whiteList,
  }) =>
      updateWhiteList(
        table: PrivacyTables.CAN_BE_INVITED_TO_JAM_WHITELIST,
        users: whiteList,
      );

  @override
  Future<void> updateCanBeInvitedToJams({
    required PrivacyBoundaries canBeInvitedToJams,
  }) =>
      updateVisiblity(
        column: PrivacyTables.CAN_BE_INVITED_TO_JAMS,
        visibility: canBeInvitedToJams,
      );

  @override
  Future<void> updateInvitableToCommunitiesUserList({
    required Users whiteList,
  }) =>
      updateWhiteList(
        table: PrivacyTables.CAN_BE_INVITED_TO_COMMUNITIES_WHITELIST,
        users: whiteList,
      );

  @override
  Future<void> updateLastSeenVisibility({
    required PrivacyBoundaries lastSeenVisibility,
  }) =>
      updateVisiblity(
        column: PrivacyTables.LAST_SEEN_VISIBILITY,
        visibility: lastSeenVisibility,
      );

  @override
  Future<void> updateMapVisibility({
    required PrivacyBoundaries mapVisibility,
  }) =>
      updateVisiblity(
        column: PrivacyTables.MAP_VISIBILITY,
        visibility: mapVisibility,
      );

  @override
  Future<void> updatePhoneVisibility({
    required PrivacyBoundaries phoneVisibility,
  }) =>
      updateVisiblity(
        column: PrivacyTables.PHONE_VISIBILITY,
        visibility: phoneVisibility,
      );

  @override
  Future<void> updatePhoneVisibilityWhiteList({
    required Users whiteList,
  }) =>
      updateWhiteList(
        table: PrivacyTables.PHONE_VISIBILITY_WHITELIST,
        users: whiteList,
      );

  @override
  Future<void> updateVisibleOnMapToUserList({
    required Users whiteList,
  }) =>
      updateWhiteList(
        table: PrivacyTables.MAP_VISIBILITY_WHITELIST,
        users: whiteList,
      );
}
