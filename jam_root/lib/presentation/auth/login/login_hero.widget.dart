import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class LoginHero extends StatefulHookConsumerWidget {
  const LoginHero({
    super.key,
  });

  @override
  ConsumerState<LoginHero> createState() => _LoginHeroState();
}

class _LoginHeroState extends ConsumerState<LoginHero> {
  late final ValueNotifier<String> currentImage;
  late final Timer imageTimer;
  Strings networkImages = [];

  @override
  void initState() {
    super.initState();
    currentImage = ValueNotifier(
      ImagePathConstants.DEFAULT_LOGIN_BACKGROUND_IMAGE_PATH,
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final value = await ref.read(loginBackgroundsProvider.future);
        networkImages = value;
        var imageLoaders = <Future>[];
        for (var imageUrl in networkImages) {
          if (imageUrl.startsWith('http')) {
            var completer = Completer();
            var image = NetworkImage(imageUrl);
            image.resolve(const ImageConfiguration()).addListener(
                  ImageStreamListener(
                    (info, _) => completer.complete(),
                    onError: (exception, stackTrace) =>
                        completer.completeError(exception, stackTrace),
                  ),
                );
            imageLoaders.add(completer.future);
          }
        }
        await Future.wait(imageLoaders);
        imageTimer = Timer.periodic(
          const Duration(seconds: 10),
          (timer) {
            currentImage.value =
                networkImages[Random().nextInt(networkImages.length)];
          },
        );
      },
    );
  }

  @override
  void dispose() {
    imageTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ClipShadowPath(
        shadow: Shadow(
          color: Colors.black.withOpacity(0.5),
          offset: const Offset(0, 0),
          blurRadius: 10,
        ),
        clipper: const RoundedBottomClipper(height: 0.6),
        child: PhysicalModel(
          color: Colors.transparent,
          elevation: 10,
          child: ValueListenableBuilder<String>(
            valueListenable: currentImage,
            builder: (context, value, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  key: ValueKey(value),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: value.startsWith('http')
                          ? NetworkImage(value) as ImageProvider<Object>
                          : AssetImage(value),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
