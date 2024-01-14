import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class SettingsPage extends HookConsumerWidget with ProfileRepositoryProviders {
  const SettingsPage({super.key, required this.profile});

  final UserProfileModel profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = useState(profile);

    ref.listen(
      currentUserProfileProvider,
      (_, next) {
        if (next is AsyncData &&
            !next.asData!.isLoading &&
            next.asData!.error == null) {
          profileState.value = next.value!;
        }
      },
    );

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
                    profile: profileState.value,
                    radius: 40,
                  ),
                  onTap: () => context.pushNamed(
                    SettingsRoutes.profile.name,
                    extra: profileState.value,
                  ),
                  horizontalTitleGap: 6,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  title: Text(
                    profileState.value.username ??
                        profileState.value.fullName ??
                        'Wtf where is my name',
                    style: context.jText.bodyMedium,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      profileState.value.profileStatus ?? '',
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
                const Spacer(),
                ElevatedButton(
                  onPressed: () => ref.read(authRepositoryProvider).logout(),
                  child: const Text('Logout'),
                ),
                const SizedBox(height: 20),
                const _MadeByPlaceholder()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MadeByPlaceholder extends HookWidget {
  const _MadeByPlaceholder();

  @override
  Widget build(BuildContext context) {
    final tappedTimes = useState(0);

    tappedTimes.addListener(
      () {
        if (tappedTimes.value == 5) {
          showAdaptiveDialog(
            context: context,
            builder: (ctx) => GestureDetector(
              onTap: () => Navigator.of(ctx).pop(),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/default.jpg'),
                  ),
                ),
              ),
            ),
          );
          tappedTimes.value = 0;
        }
      },
    );

    return GestureDetector(
      onTap: () =>
          tappedTimes.value < 5 ? tappedTimes.value++ : tappedTimes.value = 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('made by ', style: context.jText.headlineSmall),
              Text('Dmitriy Mecker', style: context.jText.headlineMedium),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
