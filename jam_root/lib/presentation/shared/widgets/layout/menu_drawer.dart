import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';

class MenuDrawer extends HookConsumerWidget with ProfileRepositoryProviders {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(currentUserProfileProvider).maybeWhen(
            data: (data) => Drawer(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -100,
                    left: -50,
                    child: Transform.rotate(
                      angle: 3.14 / 1.3,
                      child: Container(
                        color: context.jColor.secondary,
                        width: MediaQuery.of(context).size.width + 50,
                        height: 150,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -60,
                    left: -50,
                    child: Transform.rotate(
                      angle: 3.14 / 10,
                      child: Container(
                        color: context.jColor.primary,
                        width: MediaQuery.of(context).size.width + 50,
                        height: 150,
                      ),
                    ),
                  ),
                  DrawerMenu(profile: data),
                ],
              ),
            ),
            orElse: () => const SizedBox(),
          );
}

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({super.key, required this.profile});

  final UserProfileModel profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _DrawerHeader(profile: profile),
            _DrawerTile(
              imagePath: ImagePathConstants.JAM_WITH_MAP_IMAGE_PATH,
              title: 'Map',
              routeName: MapRoutes.map.name,
            ),
            _DrawerTile(
              imagePath: ImagePathConstants.JAM_HOLDING_JAM_IMAGE_PATH,
              title: 'Jams',
              routeName: JamRoutes.jams.name,
            ),
            _DrawerTile(
              imagePath: ImagePathConstants.JAM_ENGINEER_IMAGE_PATH,
              title: 'Settings',
              routeName: SettingsRoutes.settings.name,
              profile: profile,
            ),
          ],
        ),
        _buildLogout(context, ref),
      ],
    );
  }

  ListTile _buildLogout(BuildContext context, WidgetRef ref) => ListTile(
        contentPadding: const EdgeInsets.only(left: 20),
        leading: FaIcon(
          FontAwesomeIcons.arrowRightFromBracket,
          color: ColorHelper.colorContrast(context.jColor.primary),
          size: 18,
        ),
        title: Text(
          'Logout',
          style: context.jText.bodyMedium?.copyWith(
            color: ColorHelper.colorContrast(context.jColor.primary),
          ),
        ),
        onTap: () => ref.read(authRepositoryProvider).logout(),
      );
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({required this.profile});

  final UserProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 180),
      child: DrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.jTheme.primaryColor,
              context.jColor.primaryContainer,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroAvatar(
                  profile: profile,
                  radius: 25,
                  onTap: () => context.pushNamed(
                    SettingsRoutes.settings.name,
                    extra: profile,
                  ),
                ),
                IconButton(
                  onPressed: () => _toggleThemeMode(context),
                  icon: Theme.of(context).brightness == Brightness.light
                      ? const Icon(Icons.sunny)
                      : const Icon(Icons.nightlight_round),
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   profile.username ?? 'User',
                //   style: context.jText.bodyMedium,
                // ),
                Text(
                  profile.username ?? 'User',
                  style: context.jText.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _toggleThemeMode(BuildContext context) {
    ThemeSwitcher.of(context).toggleThemeMode();
    JamTheme.setThemeMode(
      mode: ThemeSwitcher.of(context).themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeSwitcher.of(context).themeData.themeInfo,
      color: ThemeSwitcher.of(context).themeData.themeInfo ==
              SupportedThemes.customColorTheme
          ? JamCustomColorTheme().color
          : null,
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.imagePath,
    required this.title,
    required this.routeName,
    this.profile,
  });

  final String imagePath;
  final String title;
  final String routeName;
  final UserProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10),
      leading: Container(
        padding: const EdgeInsets.all(0),
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imagePath,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: context.jText.bodyMedium,
      ),
      onTap: () => context.pushNamed(routeName, extra: profile),
    );
  }
}
