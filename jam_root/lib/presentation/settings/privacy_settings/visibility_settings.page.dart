import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class PrivacyVisibilitySettingPage extends HookConsumerWidget
    with ProfileRepositoryProviders {
  const PrivacyVisibilitySettingPage({super.key, required this.section});

  final PrivacySettingsRoutes section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = context.jColor.primary;

    final headlineStyle = context.jText.headlineMedium?.copyWith(
      color: primaryColor,
    );

    return Scaffold(
      appBar: SimpleAppBar(title: "${section.displayName} privacy"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: ref.watch(getPrivacySettingsProvider).maybeWhen(
                data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (section.unimplemented)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Text(
                          'This feature is not yet implemented (IN PROGRESS)',
                          style: headlineStyle,
                        ),
                      ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Text(_getTitle(), style: headlineStyle),
                    ),
                    const SizedBox(height: 20),
                    ...PrivacyBoundaries.values
                        .where(
                          (element) =>
                              element != PrivacyBoundaries.rangeOfUsers,
                        )
                        .map(
                          (e) => ListTileTheme(
                            dense: true,
                            child: RadioListTile(
                              groupValue: _getStatus(data),
                              title: Text(e.displayName),
                              value: e,
                              onChanged: (value) => _updatePrivacy(ref, value!),
                            ),
                          ),
                        ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Always allow to', style: headlineStyle),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const JamDivider(),
                    _buildAddToExceptionListRedirectButton(
                      primaryColor,
                      context,
                      ref,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: _getExceptionUserList(
                        data,
                        context,
                        ref,
                      ),
                    )
                  ],
                ),
                orElse: () => const SizedBox(),
              ),
        ),
      ),
    );
  }

  ShakesOnNoLongPress _buildAddToExceptionListRedirectButton(
    Color primaryColor,
    BuildContext context,
    WidgetRef ref,
  ) {
    return ShakesOnNoLongPress(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        title: Text(
          'Add user to exception list',
          style: context.jText.bodySmall?.copyWith(color: primaryColor),
        ),
        onTap: () => _openContactSelector(context, ref),
      ),
    );
  }

  List<Dismissible> _getExceptionUserList(
    UserProfilePrivacySettingsModel privacy,
    BuildContext context,
    WidgetRef ref,
  ) =>
      _whiteList(privacy)
          .map(
            (e) => Dismissible(
              resizeDuration: const Duration(milliseconds: 300),
              confirmDismiss: (direction) async {
                await _removeFromWhiteList(ref, e, privacy);
                return true;
              },
              background: Container(
                color: context.jColor.primary.withOpacity(0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.delete),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Remove from list',
                      style: context.jText.headlineSmall
                          ?.copyWith(color: Colors.red),
                    ),
                    const SizedBox(width: 15)
                  ],
                ),
              ),
              key: Key(e.id),
              direction: DismissDirection.endToStart,
              child: ShakesOnNoLongPress(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      e.avatar?.isNotEmpty ?? false
                          ? e.avatar!
                          : ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
                    ),
                  ),
                  title: Text(e.username ?? 'User'),
                ),
              ),
            ),
          )
          .toList();

  _openContactSelector(BuildContext context, WidgetRef ref) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContactSelectorPage(
            title: 'Always allow',
            onSelected: (selected) async =>
                await _updateWhiteList(ref, selected),
          ),
        ),
      );

  String _getTitle() => switch (section) {
        PrivacySettingsRoutes.phonePrivacy =>
          'Who can see your ${section.displayName.toLowerCase()}?',
        PrivacySettingsRoutes.lastActivityPrivacy =>
          'Who can see your ${section.displayName.toLowerCase()}?',
        PrivacySettingsRoutes.aboutMePrivacy =>
          'Who can see your profile status?',
        PrivacySettingsRoutes.communityInvitePrivacy =>
          'Who can invite you to communities?',
        PrivacySettingsRoutes.jamInvitePrivacy => 'Who can invite you to jams?',
        PrivacySettingsRoutes.mapVisibilityPrivacy =>
          'Who can see you on the map?',
      };

  Future _updatePrivacy(WidgetRef ref, PrivacyBoundaries boundaries) =>
      switch (section) {
        PrivacySettingsRoutes.mapVisibilityPrivacy =>
          ref.read(updateMapVisibilityProvider(visibility: boundaries).future),
        PrivacySettingsRoutes.aboutMePrivacy => ref.read(
            updateAboutMeVisibilityProvider(visibility: boundaries).future),
        PrivacySettingsRoutes.communityInvitePrivacy => ref.read(
            updateCanBeInvitedToCommunitiesProvider(visibility: boundaries)
                .future),
        PrivacySettingsRoutes.jamInvitePrivacy => ref.read(
            updateCanBeInvitedToJamsProvider(visibility: boundaries).future),
        PrivacySettingsRoutes.lastActivityPrivacy => ref.read(
            updateLastSeenVisibilityProvider(visibility: boundaries).future),
        PrivacySettingsRoutes.phonePrivacy => ref
            .read(updatePhoneVisibilityProvider(visibility: boundaries).future),
      }
          .then(
        (value) => ref.invalidate(getPrivacySettingsProvider),
      );

  Future _updateWhiteList(WidgetRef ref, List<UserProfileModel> users) =>
      switch (section) {
        PrivacySettingsRoutes.mapVisibilityPrivacy => ref.read(
            updateMapVisibilityWhiteListProvider(whiteList: users).future),
        PrivacySettingsRoutes.aboutMePrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .updateAboutMeVisibilityWhiteList(whiteList: users),
        PrivacySettingsRoutes.communityInvitePrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .updateInvitableToCommunitiesUserList(whiteList: users),
        PrivacySettingsRoutes.jamInvitePrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .updateCanBeInvitedToJamWhiteList(whiteList: users),
        PrivacySettingsRoutes.lastActivityPrivacy => Future.value([]),
        PrivacySettingsRoutes.phonePrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .updatePhoneVisibilityWhiteList(whiteList: users),
      }
          .then((value) => ref.invalidate(getPrivacySettingsProvider));

  Future _removeFromWhiteList(
    WidgetRef ref,
    UserProfileModel user,
    UserProfilePrivacySettingsModel privacy,
  ) =>
      switch (section) {
        PrivacySettingsRoutes.mapVisibilityPrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .removeUserFromMapVisibilityWhiteList(userId: user.id),
        PrivacySettingsRoutes.aboutMePrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .removeUserAboutMeVisibilityWhiteList(userId: user.id),
        PrivacySettingsRoutes.communityInvitePrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .removeUserInvitableToCommunitiesUserList(userId: user.id),
        PrivacySettingsRoutes.jamInvitePrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .removeUserCanBeInvitedToJamWhiteList(userId: user.id),
        PrivacySettingsRoutes.lastActivityPrivacy => Future.value([]),
        PrivacySettingsRoutes.phonePrivacy => ref
            .read(userPrivacyRepositoryProvider)
            .removeUserPhoneVisibilityWhiteList(userId: user.id),
      }
          .then((value) => ref.invalidate(getPrivacySettingsProvider));

  PrivacyBoundaries _getStatus(UserProfilePrivacySettingsModel data) =>
      switch (section) {
        PrivacySettingsRoutes.mapVisibilityPrivacy => data.mapVisibility,
        PrivacySettingsRoutes.aboutMePrivacy => data.aboutMeVisiblity,
        PrivacySettingsRoutes.communityInvitePrivacy =>
          data.canBeInvitedToCommunities,
        PrivacySettingsRoutes.jamInvitePrivacy => data.canBeInvitedToJams,
        PrivacySettingsRoutes.lastActivityPrivacy =>
          data.displayLastSeenVisibility,
        PrivacySettingsRoutes.phonePrivacy => data.phoneVisiblity,
      };

  List<UserProfileModel> _whiteList(UserProfilePrivacySettingsModel data) =>
      switch (section) {
        PrivacySettingsRoutes.mapVisibilityPrivacy =>
          data.visibleOnMapToUserList,
        PrivacySettingsRoutes.aboutMePrivacy =>
          data.aboutMeVisibilityJamsUserList,
        PrivacySettingsRoutes.jamInvitePrivacy => data.invitableToJamsUserList,
        PrivacySettingsRoutes.lastActivityPrivacy =>
          data.displayLastSeenVisibilityWhitelist,
        PrivacySettingsRoutes.phonePrivacy => data.phoneVisibilityJamsUserList,
        PrivacySettingsRoutes.communityInvitePrivacy =>
          data.invitableToCommunitesUserList,
      };
}
