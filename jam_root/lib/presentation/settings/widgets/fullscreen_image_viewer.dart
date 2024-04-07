import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class FullScreenImageViewer extends HookWidget with ProfileRepositoryProviders {
  const FullScreenImageViewer({
    super.key,
    required this.images,
    required this.mainAvatar,
    this.isPersonal = true,
  });

  final Strings images;
  final int mainImageIndex = 0;
  final bool? isPersonal;
  final String mainAvatar;

  @override
  Widget build(BuildContext context) {
    final mainImageIndexState = useState(mainImageIndex);
    final pageController = usePageController();
    final imagesState = useState(
      images.sortCopy(
        (a, b) => images.indexOf(a) == images.indexOf(mainAvatar) ? -1 : 1,
      ),
    );

    return PageView.builder(
      controller: pageController,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () => context.pop(),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: context.jColor.background,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      imagesState.value[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: CachedNetworkImage(
                        imageUrl: imagesState.value[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              if (isPersonal ?? true)
                _buildGalleryActionButtons(
                  mainImageIndexState,
                  index,
                  context,
                  pageController,
                  imagesState,
                ),
            ],
          ),
        );
      }),
      itemCount: imagesState.value.length,
    );
  }

  Consumer _buildGalleryActionButtons(
    ValueNotifier<int> mainImageIndexState,
    int index,
    BuildContext context,
    PageController controller,
    ValueNotifier<Strings> imagesState,
  ) =>
      Consumer(
        builder: (context, ref, child) {
          return Positioned(
            top: 40,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => _handleSetMainAvatar(
                    index,
                    mainImageIndexState,
                    imagesState,
                    ref,
                  ),
                  icon: Icon(
                    mainImageIndexState.value == index
                        ? Icons.star
                        : Icons.star_outline,
                    size: 30,
                    color: Colors.white,
                  ),
                  color: Colors.transparent,
                ),
                IconButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => DestructiveDialog(
                      onConfirm: (_) => _handleDeleteAvatar(
                        context,
                        index,
                        controller,
                        imagesState,
                        ref,
                      ),
                      title: 'Delete image',
                      subtitle: 'You sure you want to delete this image?',
                    ),
                  ),
                  icon: const Icon(Icons.delete, size: 30, color: Colors.red),
                  color: Colors.transparent,
                )
              ],
            ),
          );
        },
      );

  void _handleDeleteAvatar(
    BuildContext context,
    int index,
    PageController controller,
    ValueNotifier<Strings> imagesState,
    WidgetRef ref,
  ) {
    ref
        .read(userProfileRepository)
        .images
        .deleteProfilePhoto(photoId: imagesState.value[index])
        .then(
      (value) {
        // ref.invalidate(currentUserProfileProvider);
        if (imagesState.value.length == 1) {
          context.pop();
        }

        controller.jumpTo(
          imagesState.value.length - 1 == index ? index - 1 : index + 1,
        );

        imagesState.value = imagesState.value
            .where((element) => element != imagesState.value[index])
            .toList();
      },
    );
  }

  void _handleSetMainAvatar(
    int index,
    ValueNotifier<int> mainImageIndexState,
    ValueNotifier<Strings> imagesState,
    WidgetRef ref,
  ) async {
    if (mainImageIndexState.value == index) return;
    mainImageIndexState.value = index;
    ref.read(userStateProvider).setMainAvatar(imagesState.value[index]);
    // await ref
    //     .read(userProfileRepository)
    //     .images
    //     .setMainAvatar(imagesState.value[index]);
    // ref.invalidate(currentUserProfileProvider);
  }
}
