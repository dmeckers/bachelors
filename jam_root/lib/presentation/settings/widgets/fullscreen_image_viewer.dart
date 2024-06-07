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

class FullScreenImageViewer extends HookConsumerWidget
    with ProfileRepositoryProviders {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final mainImageIndexState = useState(mainImageIndex);
    final pageController = usePageController();
    final imagesState = useState(
      images.sortCopy(
        (a, b) => images.indexOf(a) == images.indexOf(mainAvatar) ? -1 : 1,
      ),
    );

    return PageView.builder(
      controller: pageController,
      itemCount: imagesState.value.length,
      itemBuilder: ((context, index) {
        final imageUrl = imagesState.value[index];

        return GestureDetector(
          onTap: () => context.pop(),
          child: Stack(
            children: [
              _buildImageContainer(context, imageUrl),
              if (isPersonal ?? true)
                Positioned(
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
                              imagesState,
                              mainImageIndexState,
                              ref,
                              pageController,
                            ),
                            title: 'Delete image',
                            subtitle: 'You sure you want to delete this image?',
                          ),
                        ),
                        icon: const Icon(Icons.delete,
                            size: 30, color: Colors.red),
                        color: Colors.transparent,
                      )
                    ],
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Container _buildImageContainer(BuildContext context, String imageUrl) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: context.jColor.background,
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            imageUrl,
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
              imageUrl: imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  void _handleDeleteAvatar(
    BuildContext context,
    int index,
    ValueNotifier<Strings> imagesState,
    ValueNotifier<int> mainImageIndexState,
    WidgetRef ref,
    PageController pageController,
  ) async {
    await ref
        .read(userStateProvider)
        .deleteProfilePhoto(photoId: imagesState.value[index]);

    if (imagesState.value.length == 1 && context.mounted) {
      context.pop();
      return;
    }

    final currentPageIndex = pageController.page!.round();
    final imageToRemove = imagesState.value[currentPageIndex];

    pageController.jumpToPage(
      currentPageIndex + (currentPageIndex == 0 ? 1 : -1),
    );

    imagesState.value = [
      ...imagesState.value.where((img) => img != imageToRemove)
    ];
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
  }
}
