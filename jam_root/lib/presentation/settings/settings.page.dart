import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class SettingsPage extends HookConsumerWidget with ProfileRepositoryProviders {
  const SettingsPage({super.key, required this.profile});

  final UserProfileModel profile;

  _handleTest(BuildContext context, WidgetRef ref) {
    context.doIfMounted(
      () => JSnackBar.show(
        context,
        const JSnackbarData(
          description: 'Failed to send password reset link',
          type: SnackbarInfoType.error,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(user$);

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Settings'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShakesOnNoLongPress(
                    child: ListTile(
                  leading: HeroAvatar(
                    profile: userState.requireValue,
                    radius: 40,
                  ),
                  onTap: () => context.pushNamed(
                    SettingsRoutes.profile.name,
                    extra: userState.requireValue,
                  ),
                  horizontalTitleGap: 6,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  title: Text(
                    userState.requireValue.username ??
                        userState.requireValue.fullName ??
                        'User name',
                    style: context.jText.bodyMedium,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      userState.requireValue.profileStatus ?? '',
                      style: context.jText.bodySmall?.copyWith(
                        fontSize: 12,
                        color: context.jColor.tertiary,
                      ),
                    ),
                  ),
                )),
                const Divider(height: 0.5, color: Colors.white54),
                SettingsTile(
                  leading: const Icon(Icons.account_box),
                  title: 'Account',
                  subtitle: 'Email, phone number ,theme , password.',
                  onTap: () => context.pushNamed(SettingsRoutes.account.name),
                ),
                SettingsTile(
                  leading: const Icon(Icons.lock),
                  title: 'Privacy',
                  subtitle:
                      'Control who can see you on the map, invite to jams, find by phone number etc.',
                  onTap: () => context.pushNamed(SettingsRoutes.privacy.name),
                ),
                SettingsTile(
                  leading: const Icon(Icons.emoji_people_rounded),
                  title: 'Invite friend',
                  onTap: () =>
                      context.pushNamed(SettingsRoutes.inviteFriend.name),
                ),
                SettingsTile(
                  leading: const Icon(Icons.help),
                  title: 'Help',
                  subtitle: 'Contact us , privacy policy , terms of use.',
                  onTap: () => context.pushNamed(SettingsRoutes.help.name),
                ),
                ElevatedButton(
                  onPressed: () async => await _handleTest(context, ref),
                  child: const Text('test'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => ref.read(authRepositoryProvider).logout(),
                  child: const Text('Logout'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('made by ', style: context.jText.headlineSmall),
                        Text('Dmitriy Mecker',
                            style: context.jText.headlineMedium),
                        const SizedBox(height: 50)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
