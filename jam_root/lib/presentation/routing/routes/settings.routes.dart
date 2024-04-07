import 'package:go_router/go_router.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

enum SettingsRoutes {
  settings,
  profile,
  account,
  privacy,
  friends,
  inviteFriend,
  help
}

enum PrivacySettingsRoutes {
  phonePrivacy('Phone', true),
  lastActivityPrivacy('Last activity', false),
  aboutMePrivacy('About me', true),
  // forwardMessagesPrivacy('Forward messages'),
  communityInvitePrivacy('Community invite', false),
  jamInvitePrivacy('Jam invite', true),
  mapVisibilityPrivacy('Map visibility', false);

  final String displayName;
  final bool unimplemented;

  const PrivacySettingsRoutes(this.displayName, this.unimplemented);
}

enum HelpRoutes { faq }

final settingsRoutes = GoRoute(
    path: SettingsRoutes.settings.name,
    name: SettingsRoutes.settings.name,
    builder: (_, state) => SettingsPage(
          profile: state.extra as UserProfileModel,
        ),
    routes: [
      GoRoute(
        path: SettingsRoutes.profile.name,
        name: SettingsRoutes.profile.name,
        builder: (_, state) => ProfileSettingsPage(
          profile: state.extra as UserProfileModel,
        ),
      ),
      GoRoute(
          path: SettingsRoutes.account.name,
          name: SettingsRoutes.account.name,
          builder: (_, __) => const AccountSettingsPage()),
      GoRoute(
          path: SettingsRoutes.privacy.name,
          name: SettingsRoutes.privacy.name,
          builder: (_, __) => const PrivacySettingsPage(),
          routes: [
            GoRoute(
                path: PrivacySettingsRoutes.phonePrivacy.name,
                name: PrivacySettingsRoutes.phonePrivacy.name,
                builder: (_, __) => const PrivacyVisibilitySettingPage(
                    section: PrivacySettingsRoutes.phonePrivacy)),
            GoRoute(
                path: PrivacySettingsRoutes.lastActivityPrivacy.name,
                name: PrivacySettingsRoutes.lastActivityPrivacy.name,
                builder: (_, __) => const PrivacyVisibilitySettingPage(
                    section: PrivacySettingsRoutes.lastActivityPrivacy)),
            GoRoute(
                path: PrivacySettingsRoutes.aboutMePrivacy.name,
                name: PrivacySettingsRoutes.aboutMePrivacy.name,
                builder: (_, __) => const PrivacyVisibilitySettingPage(
                    section: PrivacySettingsRoutes.aboutMePrivacy)),
            GoRoute(
                path: PrivacySettingsRoutes.communityInvitePrivacy.name,
                name: PrivacySettingsRoutes.communityInvitePrivacy.name,
                builder: (_, __) => const PrivacyVisibilitySettingPage(
                    section: PrivacySettingsRoutes.communityInvitePrivacy)),
            GoRoute(
                path: PrivacySettingsRoutes.jamInvitePrivacy.name,
                name: PrivacySettingsRoutes.jamInvitePrivacy.name,
                builder: (_, __) => const PrivacyVisibilitySettingPage(
                    section: PrivacySettingsRoutes.jamInvitePrivacy)),
            GoRoute(
                path: PrivacySettingsRoutes.mapVisibilityPrivacy.name,
                name: PrivacySettingsRoutes.mapVisibilityPrivacy.name,
                builder: (_, __) => const PrivacyVisibilitySettingPage(
                    section: PrivacySettingsRoutes.mapVisibilityPrivacy)),
          ]),
      GoRoute(
          path: SettingsRoutes.friends.name,
          name: SettingsRoutes.friends.name,
          builder: (_, __) => const FriendsSettingsPage()),
      GoRoute(
          path: SettingsRoutes.inviteFriend.name,
          name: SettingsRoutes.inviteFriend.name,
          builder: (_, __) => const InviteFriendPage()),
      GoRoute(
          path: SettingsRoutes.help.name,
          name: SettingsRoutes.help.name,
          builder: (_, __) => const HelpPage(),
          routes: [
            GoRoute(
                path: HelpRoutes.faq.name,
                name: HelpRoutes.faq.name,
                builder: (_, __) => const FAQPage()),
          ]),
    ]);
