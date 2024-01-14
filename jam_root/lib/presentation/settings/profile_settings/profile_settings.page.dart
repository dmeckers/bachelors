import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class ProfileSettingsPage extends HookConsumerWidget
    with ProfileRepositoryProviders {
  const ProfileSettingsPage({super.key, required this.profile});

  final UserProfileModel profile;

  static const dividerColor = Color.fromARGB(35, 255, 255, 255);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = context.jColor.tertiary;
    final showFAB = useState(false);
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

    useEffect(() {
      Future.delayed(
        const Duration(milliseconds: 100),
        () => showFAB.value = true,
      );
      return null;
    }, []);

    return Scaffold(
      floatingActionButton: _buildFAB(showFAB, context, ref),
      floatingActionButtonLocation: const _CustomFloatingActionButtonLocation(),
      appBar: const SimpleAppBar(title: 'Profile settings'),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            HeroAvatar(
              radius: 60,
              profile: profileState.value,
              onTap: () => profileState.value.photoUrls?.isNotEmpty ?? false
                  ? _showFullScreenImageViewer(
                      context: context,
                      images: profileState.value.photoUrls!,
                      mainAvatar: profileState.value.avatar ?? '',
                    )
                  : null,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
              child: Column(
                children: [
                  SettingsTile(
                    leading: Icon(Icons.person, color: iconColor),
                    title:
                        profileState.value.username ?? 'Wtf where is my name',
                    subtitle: 'Username',
                    trailing: Icon(Icons.edit, color: iconColor),
                    onTap: () => _handleChangeTileTap(
                      context,
                      initialValue:
                          profileState.value.username ?? 'Wtf where is my name',
                      onConfirm: (value) async {
                        profileState.value = profileState.value.copyWith(
                          username: value,
                        );
                        await ref
                            .read(userProfileRepository)
                            .updateUserName(username: value);
                        ref.invalidate(currentUserProfileProvider);
                      },
                      title: 'Username',
                    ),
                  ),
                  const JamDivider(),
                  SettingsTile(
                    leading: Icon(Icons.info, color: iconColor),
                    title: profileState.value.profileStatus ?? 'No status',
                    subtitle: 'Profile status',
                    trailing: Icon(Icons.edit, color: iconColor),
                    onTap: () => _handleChangeTileTap(
                      context,
                      initialValue: profileState.value.profileStatus ?? '',
                      onConfirm: (value) async {
                        profileState.value = profileState.value.copyWith(
                          profileStatus: value,
                        );
                        await ref
                            .read(userProfileRepository)
                            .updateProfileStatus(status: value);
                        ref.invalidate(currentUserProfileProvider);
                      },
                      title: 'Profile status',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _handleChangeTileTap(
    BuildContext context, {
    required String initialValue,
    required Future Function(String value) onConfirm,
    required String title,
  }) {
    return showDialog(
      context: context,
      builder: (_) => FixedInputDialog(
        title: title,
        initialValue: initialValue,
        onConfirm: onConfirm,
      ),
    );
  }

  AnimatedSwitcher _buildFAB(
    ValueNotifier<bool> showFAB,
    BuildContext context,
    WidgetRef ref,
  ) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: showFAB.value
          ? FloatingActionButton(
              onPressed: () =>
                  _showAddPhotoBottomSheet(context: context, ref: ref),
              shape: const CircleBorder(),
              mini: true,
              child: const Icon(Icons.add),
            )
          : const SizedBox(),
    );
  }

  void _showAddPhotoBottomSheet({
    required BuildContext context,
    required WidgetRef ref,
  }) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => PickImageBottomSheet(
          onImagePicked: (image) async {
            if (image == null) return;

            await ref
                .read(userProfileRepository)
                .images
                .addProfilePhoto(image: File(image.path));

            ref.invalidate(currentUserProfileProvider);
          },
        ),
      );

  _showFullScreenImageViewer({
    required BuildContext context,
    required List<String> images,
    required String mainAvatar,
  }) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullScreenImageViewer(
            images: images,
            mainAvatar: mainAvatar,
          ),
        ),
      );
}

class _CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  const _CustomFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double x = scaffoldGeometry.scaffoldSize.width / 1.8;
    final double y = scaffoldGeometry.contentTop * 2.2;

    return Offset(x, y);
  }
}
