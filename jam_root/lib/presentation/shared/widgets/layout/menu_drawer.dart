import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:showcaseview/showcaseview.dart';

final _showcaseKey1 = GlobalKey();
final _showcaseKey2 = GlobalKey();

class MenuDrawer extends HookConsumerWidget
    with ProfileRepositoryProviders, Storer {
  const MenuDrawer({super.key});
  _showCaseIfWasnYet(BuildContext context) {
    useEffect(() {
      final user = hiveGet<UserProfileModel>();

      if (user.isNull || user!.isShowcased) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ShowCaseWidget.of(context).startShowCase([
          _showcaseKey1,
          _showcaseKey2,
        ]);
      });

      return null;
    }, []);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _showCaseIfWasnYet(context);

    return ref.watch(user$).maybeWhen(
          data: (data) {
            return Drawer(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Stack(
                children: [
                  _decorationContainer(context, true),
                  _decorationContainer(context, false),
                  DrawerWidget(profile: data),
                ],
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
  }

  Widget _decorationContainer(
    BuildContext context,
    bool first,
  ) =>
      Positioned(
        bottom: first ? -100 : -60,
        left: -50,
        child: Transform.rotate(
          angle: first ? 3.14 / 1.3 : 3.14 / 10,
          child: Container(
            color: first ? context.jColor.secondary : context.jColor.primary,
            width: MediaQuery.of(context).size.width + 50,
            height: 150,
          ),
        ),
      );
}

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key, required this.profile});

  final UserProfileModel profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setUserIntroduced() {
      ref.read(userStateProvider).updateIsShowCased(true);
      ShowCaseWidget.of(context).completed(_showcaseKey2);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            _DrawerHeader(profile: profile),
            Showcase(
              key: _showcaseKey1,
              description: 'Here you can find new friends',
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _DrawerTile(
                  icon: FontAwesomeIcons.map,
                  title: 'Map',
                  routeName: MapRoutes.map.name,
                ),
              ),
            ),
            Showcase(
              key: _showcaseKey2,
              onBarrierClick: setUserIntroduced,
              onTargetClick: setUserIntroduced,
              onToolTipClick: setUserIntroduced,
              disposeOnTap: true,
              description: 'Here you access your jams',
              child: _DrawerTile(
                icon: FontAwesomeIcons.fire,
                title: 'Jams',
                routeName: JamRoutes.jams.name,
              ),
            ),
            _DrawerTile(
              icon: Icons.settings,
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
                  isPersonal: true,
                  navigateOnTap: true,
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
                Text(
                  profile.fullName,
                  style: context.jText.bodyMedium,
                ),
                if (profile.username.isNotEmptyOrNull)
                  Text(
                    profile.username!,
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
    required this.icon,
    required this.title,
    required this.routeName,
    this.profile,
  });

  final IconData icon;
  final String title;
  final String routeName;
  final UserProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 18),
      leading: Icon(
        icon,
        color: context.jColor.primary,
        size: 20,
      ),
      title: Text(
        title,
        style: context.jText.bodyMedium,
      ),
      onTap: () => context.pushNamed(routeName, extra: profile),
    );
  }
}
