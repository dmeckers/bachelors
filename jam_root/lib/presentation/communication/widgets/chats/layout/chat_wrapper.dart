import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class ChatWrapper extends ConsumerWidget {
  const ChatWrapper({
    super.key,
    required this.child,
    this.chat,
    this.jam,
  });

  final Widget child;
  final ChatModel? chat;
  final JamModel? jam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // padding: const EdgeInsets.only(top: DEFAULT_APP_BAR_HEIGHT * 1.5),
      decoration: BoxDecoration(
        image: jam.isNotNull && jam!.backgroundUrl.isNotEmptyOrNull
            ? DecorationImage(
                image: NetworkImage(jam!.backgroundUrlWithPlaceholder),
                fit: BoxFit.cover,
              )
            : chat == null
                ? _getDefault(context)
                : ref.watch(chatBackgroundProvider(chat!)).when(
                      data: (data) => data != null
                          ? DecorationImage(
                              image: FileImage(data),
                              fit: BoxFit.cover,
                            )
                          : _getDefault(context),
                      error: (e, _) => _getDefault(context),
                      loading: () => null,
                    ),
      ),
      height: MediaQuery.of(context).size.height,
      child: child,
    );
  }

  _getDefault(BuildContext context) => DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          Theme.of(context).brightness == Brightness.dark
              ? ImagePathConstants.DEFAULT_CHAT_BACKGROUND_DARK
              : ImagePathConstants.DEFAULT_CHAT_BACKGROUND,
        ),
      );
}
