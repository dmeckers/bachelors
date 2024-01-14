import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class PrivacySettingsPage extends HookConsumerWidget {
  const PrivacySettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privacySettings = ref.watch(getPrivacySettingsProvider);

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Privacy'),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 20),
          ...PrivacySettingsRoutes.values.map((e) {
            return Column(
              children: [
                SettingsTile(
                  title: e.displayName,
                  onTap: () => context.pushNamed(e.name),
                  trailing: privacySettings.when(
                    data: (data) {
                      return Text(
                        _getVisiblityTextByRoute(e, data),
                        style: context.jText.headlineSmall?.copyWith(
                          color: context.jColor.tertiary,
                        ),
                      );
                    },
                    error: (__, _) => const SizedBox(),
                    loading: () => const SizedBox(),
                  ),
                ),
                const JamDivider()
              ],
            );
          }),
          SettingsTile(
            leading: const Icon(Icons.devices_other_rounded),
            title: 'Devices',
            onTap: () => debugPrint('navigate to devices options'),
          )
        ]),
      ),
    );
  }

  _buildVisibilityText(PrivacyBoundaries visiblity) => switch (visiblity) {
        PrivacyBoundaries.everyone => 'Everyone',
        PrivacyBoundaries.friendsOnly => 'Friends only',
        PrivacyBoundaries.noOne => 'No one',
        _ => 'No one'
      };

  _getVisiblityTextByRoute(
          PrivacySettingsRoutes r, UserProfilePrivacySettingsModel s) =>
      switch (r) {
        PrivacySettingsRoutes.phonePrivacy =>
          _buildVisibilityText(s.phoneVisiblity),
        PrivacySettingsRoutes.aboutMePrivacy =>
          _buildVisibilityText(s.aboutMeVisiblity),
        PrivacySettingsRoutes.communityInvitePrivacy =>
          _buildVisibilityText(s.canBeInvitedToCommunities),
        PrivacySettingsRoutes.jamInvitePrivacy =>
          _buildVisibilityText(s.canBeInvitedToJams),
        PrivacySettingsRoutes.mapVisibilityPrivacy =>
          _buildVisibilityText(s.mapVisibility),
        PrivacySettingsRoutes.lastActivityPrivacy =>
          _buildVisibilityText(s.displayLastSeenVisibility),
      };
}
