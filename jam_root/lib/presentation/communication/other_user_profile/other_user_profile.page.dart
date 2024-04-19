import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class OtherUserProfilePage extends HookConsumerWidget
    with ProfileRepositoryProviders {
  const OtherUserProfilePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getUserInfoProvider(userId)).maybeWhen(
          data: (data) {
            return Scaffold(
              appBar: SimpleAppBar(title: data.username ?? data.fullName ?? ''),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    HeroAvatar(
                      isPersonal: false,
                      profile: data,
                      radius: 60,
                      onTap: () => data.photoUrls?.isNotEmpty ?? false
                          ? _showFullScreenImageViewer(
                              context: context,
                              images: data.photoUrls!,
                              mainAvatar: data.avatar ?? '',
                            )
                          : null,
                    ),
                    const SizedBox(height: 20),
                    ShakesOnNoLongPress(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(data.fullName ?? S.of(context).noName),
                        subtitle: Text(
                          S.of(context).name,
                          style: context.jText.headlineSmall,
                        ),
                      ),
                    ),
                    ShakesOnNoLongPress(
                      child: ListTile(
                        leading: const FaIcon(FontAwesomeIcons.commentDots),
                        title: Text(data.profileStatus ?? S.of(context).noStatus),
                        subtitle: Text(
                          S.of(context).status,
                          style: context.jText.headlineSmall,
                        ),
                      ),
                    ),
                    ShakesOnNoLongPress(
                      child: ListTile(
                        leading: const FaIcon(FontAwesomeIcons.fire),
                        title: Text(
                          data.vibes.map((e) => e.name).join(', '),
                        ),
                        subtitle: Text(
                          S.of(context).vibes,
                          style: context.jText.headlineSmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          orElse: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
  }

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
            isPersonal: false,
            mainAvatar: mainAvatar,
          ),
        ),
      );
}
