import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class AccountSettingsPage extends ConsumerWidget
    with ProfileRepositoryProviders {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = context.jColor.tertiary;
    final userState = ref.watch(user$);
    final isProviderlessUser =
        supabase.auth.currentUser!.userMetadata?['provider_id'] == null;

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Account settings'),
      body: Column(
        children: [
          const SizedBox(height: 20),
          //show it only if uer was logged in with email
          SettingsTile(
            leading: FaIcon(FontAwesomeIcons.fire, color: iconColor),
            title: userState.requireValue.vibes
                .map((e) => e.name.capitalize())
                .join(', ')
                .crop(30),
            subtitle: 'Vibes (${userState.requireValue.vibes.length})',
            trailing: FaIcon(Icons.edit, color: iconColor),
            onTap: () => context.pushNamed(
              VibeRoutes.editMyVibes.name,
              extra: userState.requireValue.vibes,
            ),
          ),
          const JamDivider(),
          if (isProviderlessUser)
            SettingsTile(
              leading: Icon(Icons.email, color: iconColor),
              title: supabase.auth.currentUser!.email,
              subtitle: 'Email',
              trailing: Icon(Icons.edit, color: iconColor),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (_) => BottomSheetModalWithInput(
                  onConfirm: (value) => debugPrint(value),
                  textFieldHintText: 'Username',
                ),
              ),
            ),
          const JamDivider(),
          SettingsTile(
            leading: Icon(Icons.phone, color: iconColor),
            title: supabase.auth.currentUser!.phone?.isEmpty ?? false
                ? 'No phone number'
                : supabase.auth.currentUser!.phone,
            subtitle: 'Phone number',
            trailing: Icon(Icons.edit, color: iconColor),
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (_) => BottomSheetModalWithInput(
                onConfirm: (value) => debugPrint(value),
                textFieldHintText: 'Phone number',
              ),
            ),
          ),
          const JamDivider(),
          SettingsTile(
            leading: Icon(Icons.brush, color: iconColor),
            title: ThemeSwitcher.of(context).themeData.themeInfo.displayName,
            subtitle: 'Theme',
            trailing: Icon(Icons.edit, color: iconColor),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ThemePickerPage(),
              ),
            ),
          ),
          const JamDivider(),
          if (isProviderlessUser)
            SettingsTile(
              leading: const Icon(Icons.password, color: Colors.red),
              title: 'Change password',
              onTap: () => showDialog(
                context: context,
                builder: (_) => FixedInputDialog(
                  rules: isStrongPassword,
                  onConfirm: (value) async {
                    await ref
                        .read(authRepositoryProvider)
                        .updateUserPassword(password: value);

                    context.doIfMounted(
                      () => JSnackBar.show(
                        context,
                        description: 'Password changed successfully',
                        type: SnackbarInfoType.success,
                      ),
                    );
                  },
                  title: 'Change password',
                ),
              ),
            ),
          const JamDivider(),
          SettingsTile(
            leading: const Icon(Icons.dangerous, color: Colors.red),
            title: 'Delete account',
            onTap: () => showDialog(
              context: context,
              builder: (_) => DestructiveDialog(
                onConfirm: (_) {},
                title: 'Delete account',
                subtitle:
                    'You sure want to delete your account? This action is irreversible.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
