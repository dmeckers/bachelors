import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class EditJamDetailsPage extends ConsumerWidget {
  const EditJamDetailsPage({super.key, required this.jam});

  final JamModel jam;
  static const OPACITY_VISIBLE = 1.0;
  static const OPACITY_INVISIBLE = 0.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(jamViewModelStateProvider(jam));
    final showBackgroundUrl =
        !vm.dropBackground && vm.backgroundUrl.isNotEmptyOrNull;
    final showBackgroundImage = vm.image?.existsSync() ?? false;

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Jam details'),
      body: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: showBackgroundUrl || showBackgroundImage
                ? OPACITY_VISIBLE
                : OPACITY_INVISIBLE,
            child: Container(
              decoration: BoxDecoration(
                image: showBackgroundImage
                    ? DecorationImage(
                        opacity: 0.1,
                        image: FileImage(vm.image!),
                        fit: BoxFit.cover,
                      )
                    : showBackgroundUrl
                        ? DecorationImage(
                            opacity: 0.1,
                            image: CachedNetworkImageProvider(
                              _fullUrl(vm.backgroundUrl!),
                            ),
                            fit: BoxFit.cover,
                          )
                        : null,
              ),
            ),
          ),
          PlanJamFormPage(jam: jam)
        ],
      ),
    );
  }

  _fullUrl(String url) {
    final fullpath =
        "${SupabaseBucketConfig.jamBackgrounds.config.path.replaceFirst('userId', supabase.auth.currentUser!.id)}/$url";

    return supaBucket.getPublicUrl(fullpath);
  }
}
