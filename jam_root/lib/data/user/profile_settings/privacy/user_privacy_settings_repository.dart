import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

final userPrivacyRepositoryProvider =
    Provider<UserPrivacySettingsRepositoryInterface>(
  (ref) => UserPrivacySettingsRepository(),
);

final class UserPrivacySettingsRepository
    extends UserPrivacySettingsRepositoryInterface
    with Storer, SupabaseUserGetter {
  static const TABLE = 'security_profile_settings';
  static const ID = 'id';

  // #region visibility columns
  static const CAN_BE_FOUND_BY_PHONE = 'can_be_found_by_phone';
  static const CAN_BE_INVITED_TO_COMMUNITIES = 'can_be_invited_to_communities';
  static const CAN_BE_INVITED_TO_JAMS = 'can_be_invited_to_jams';
  static const MAP_VISIBILITY = 'map_visibility';
  static const ABOUT_ME_VISIBILITY = 'about_me_visibility';
  static const PHONE_VISIBILITY = 'phone_visibility';
  static const LAST_SEEN_VISIBILITY = 'display_last_seen_visibility';
  // #endregion
  //# region white list tables
  static const MAP_VISIBILITY_WHITE_LIST_TABLE =
      'map_visibility_user_whitelist';
  static const ABOUT_ME_VISIBILITY_WHITE_LIST_TABLE =
      'about_me_visibility_user_whitelist';
  static const CAN_BE_INVITED_TO_JAM_WHITE_LIST_TABLE =
      'invite_to_communities_user_whitelist';
  static const PHONE_VISIBILITY_WHITE_LIST_TABLE =
      'phone_visibility_user_whitelist';
  static const DISPLAY_LAST_SEEN_VISIBILITY_WHITE_LIST_TABLE =
      'display_last_seen_vsisibility_whitelist';
  static const CAN_BE_INVITED_TO_COMMUNITIES_WHITE_LIST_TABLE =
      'invite_to_communities_user_whitelist';
  // #endregion
  static const WHITE_LIST_ID = 'profile_settings_id';
  static const USER_UUID = 'user_uuid';
  static const GET_SETTINGS_RPC = 'get_user_privacy_settings';

  Future<UserProfilePrivacySettingsModel> _updateWhiteList(
    String tableKey,
    List<UserProfileModel> whiteList,
  ) async {
    final thisUserId = getUserIdOrThrow();

    await supabase.from(tableKey).delete().eq(WHITE_LIST_ID, thisUserId);

    await supabase.from(tableKey).upsert(whiteList
        .map((e) => e.id)
        .toList()
        .map((e) => {WHITE_LIST_ID: thisUserId, USER_UUID: e})
        .toList());

    return await getCurrentUserPrivacySettings();
  }

  Future<UserProfilePrivacySettingsModel> _removeFromWhiteList(
      String tableKey, String userId) async {
    final thisUserId = getUserIdOrThrow();

    await supabase
        .from(tableKey)
        .delete()
        .eq(WHITE_LIST_ID, thisUserId)
        .eq(USER_UUID, userId);

    return await getCurrentUserPrivacySettings();
  }

  Future<UserProfilePrivacySettingsModel> _updateColumn(
    String column,
    String value,
  ) async {
    final userId = getUserIdOrThrow();
    await supabase.from(TABLE).update({column: value}).eq(ID, userId);
    return await getCurrentUserPrivacySettings();
  }

  @override
  Future<UserProfilePrivacySettingsModel>
      getCurrentUserPrivacySettings() async {
    final localPrivacySettings = hiveGet<UserProfilePrivacySettingsModel>();

    if (localPrivacySettings != null) return localPrivacySettings;

    final userId = getUserIdOrThrow();
    final response = await supabase.rpc(
      GET_SETTINGS_RPC,
      params: {'user_id': userId},
    );

    final privacySettings = UserProfilePrivacySettingsModel.fromJson(
      (response as List).first,
    );

    return hivePutAndReturn<UserProfilePrivacySettingsModel>(privacySettings);
  }

  @override
  Future<void> updateVisibleOnMapToUserList({
    required List<UserProfileModel> whiteList,
  }) async {
    final privacySettings = await _updateWhiteList(
      MAP_VISIBILITY_WHITE_LIST_TABLE,
      whiteList,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(visibleOnMapToUserList: whiteList),
    );
  }

  @override
  Future<void> updateMapVisibility({
    required PrivacyBoundaries mapVisibility,
  }) async {
    final privacySettings = await _updateColumn(
      MAP_VISIBILITY,
      mapVisibility.name,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(mapVisibility: mapVisibility),
    );
  }

  @override
  Future<void> updateAboutMeVisibility({
    required PrivacyBoundaries aboutMeVisibility,
  }) async {
    final privacySettings = await _updateColumn(
      ABOUT_ME_VISIBILITY,
      aboutMeVisibility.name,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(aboutMeVisiblity: aboutMeVisibility),
    );
  }

  @override
  Future<void> updateCanBeInvitedToJams({
    required PrivacyBoundaries canBeInvitedToJams,
  }) async {
    final privacySettings = await _updateColumn(
      CAN_BE_INVITED_TO_JAMS,
      canBeInvitedToJams.name,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(canBeInvitedToJams: canBeInvitedToJams),
    );
  }

  @override
  Future<void> updateCanBeFoundByPhoneNumber({
    required PrivacyBoundaries foundByPhoneNumber,
  }) async {
    final privacySettings = await _updateColumn(
      CAN_BE_FOUND_BY_PHONE,
      foundByPhoneNumber.name,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(canBeFoundByPhone: foundByPhoneNumber),
    );
  }

  @override
  Future<void> updatePhoneVisibility({
    required PrivacyBoundaries phoneVisibility,
  }) async {
    final privacySettings = await _updateColumn(
      PHONE_VISIBILITY,
      phoneVisibility.name,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(phoneVisiblity: phoneVisibility),
    );
  }

  @override
  Future<void> updateCanBeInvitedToCommunities({
    required PrivacyBoundaries canBeInvitedToCommunities,
  }) async {
    final privacySettings = await _updateColumn(
      CAN_BE_INVITED_TO_COMMUNITIES,
      canBeInvitedToCommunities.name,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(
          canBeInvitedToCommunities: canBeInvitedToCommunities),
    );
  }

  @override
  Future<void> updateLastSeenVisibility({
    required PrivacyBoundaries lastSeenVisibility,
  }) async {
    final privacySettings = await _updateColumn(
      LAST_SEEN_VISIBILITY,
      lastSeenVisibility.name,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(displayLastSeenVisibility: lastSeenVisibility),
    );
  }

  @override
  Future<void> removeUserFromMapVisibilityWhiteList({
    required String userId,
  }) async {
    final privacySettings = await _removeFromWhiteList(
      MAP_VISIBILITY_WHITE_LIST_TABLE,
      userId,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(
        visibleOnMapToUserList: privacySettings.visibleOnMapToUserList
            .where((element) => element.id != userId)
            .toList(),
      ),
    );
  }

  @override
  Future<void> removeUserAboutMeVisibilityWhiteList({
    required String userId,
  }) async {
    final privacySettings = await _removeFromWhiteList(
      ABOUT_ME_VISIBILITY_WHITE_LIST_TABLE,
      userId,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(
        aboutMeVisibilityJamsUserList: privacySettings
            .aboutMeVisibilityJamsUserList
            .where((element) => element.id != userId)
            .toList(),
      ),
    );
  }

  @override
  Future<void> removeUserCanBeInvitedToJamWhiteList({
    required String userId,
  }) async {
    final privacySettings = await _removeFromWhiteList(
      CAN_BE_INVITED_TO_JAM_WHITE_LIST_TABLE,
      userId,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(
        invitableToJamsUserList: privacySettings.invitableToJamsUserList
            .where((element) => element.id != userId)
            .toList(),
      ),
    );
  }

  @override
  Future<void> removeUserInvitableToCommunitiesUserList({
    required String userId,
  }) async {
    final privacySettings = await _removeFromWhiteList(
      CAN_BE_INVITED_TO_COMMUNITIES_WHITE_LIST_TABLE,
      userId,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(
        invitableToCommunitesUserList: privacySettings
            .invitableToCommunitesUserList
            .where((element) => element.id != userId)
            .toList(),
      ),
    );
  }

  @override
  Future<void> removeUserPhoneVisibilityWhiteList({
    required String userId,
  }) async {
    final privacySettings = await _removeFromWhiteList(
      PHONE_VISIBILITY_WHITE_LIST_TABLE,
      userId,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      privacySettings.copyWith(
        phoneVisibilityJamsUserList: privacySettings.phoneVisibilityJamsUserList
            .where((element) => element.id != userId)
            .toList(),
      ),
    );
  }

  @override
  Future<void> updateAboutMeVisibilityWhiteList({
    required List<UserProfileModel> whiteList,
  }) async {
    await _updateWhiteList(ABOUT_ME_VISIBILITY_WHITE_LIST_TABLE, whiteList);

    hiveRefresh<UserProfilePrivacySettingsModel>(
      (await getCurrentUserPrivacySettings()).copyWith(
        aboutMeVisibilityJamsUserList: whiteList,
      ),
    );
  }

  @override
  Future<void> updateCanBeInvitedToJamWhiteList({
    required List<UserProfileModel> whiteList,
  }) async {
    await _updateWhiteList(CAN_BE_INVITED_TO_JAM_WHITE_LIST_TABLE, whiteList);

    hiveRefresh<UserProfilePrivacySettingsModel>(
      (await getCurrentUserPrivacySettings()).copyWith(
        invitableToJamsUserList: whiteList,
      ),
    );
  }

  @override
  Future<void> updateInvitableToCommunitiesUserList({
    required List<UserProfileModel> whiteList,
  }) async {
    await _updateWhiteList(
      CAN_BE_INVITED_TO_COMMUNITIES_WHITE_LIST_TABLE,
      whiteList,
    );

    hiveRefresh<UserProfilePrivacySettingsModel>(
      (await getCurrentUserPrivacySettings()).copyWith(
        invitableToCommunitesUserList: whiteList,
      ),
    );
  }

  @override
  Future<void> updatePhoneVisibilityWhiteList({
    required List<UserProfileModel> whiteList,
  }) async {
    await _updateWhiteList(PHONE_VISIBILITY_WHITE_LIST_TABLE, whiteList);

    hiveRefresh<UserProfilePrivacySettingsModel>(
      (await getCurrentUserPrivacySettings()).copyWith(
        phoneVisibilityJamsUserList: whiteList,
      ),
    );
  }

  @override
  // TODO: implement privacyQueue
  PrivacySettingsQueueInterface get privacyQueue => throw UnimplementedError();
}
