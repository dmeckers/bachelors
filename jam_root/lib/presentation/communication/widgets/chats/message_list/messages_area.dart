import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class ChatMessagesList extends HookConsumerWidget
    with
        ChatBuilderHelper,
        ChatScrollHelper,
        ChattingProviders,
        ProfileRepositoryProviders {
  ChatMessagesList({
    super.key,
    required this.messages,
    required this.chat,
  }) : keys = List<Key>.generate(
          messages.length,
          (index) => Key(
            messages[index].id.toString(),
          ),
        );

  final List<Key> keys;
  final Messages messages;
  final ChatModel chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentUser = ref.watch(currentUserProfileProvider);
    final handler = getMessageObserverHandler(ref, messages, chat.id);
    // messageObserverLazyLoad(ref, messages, chat);

    final controller = ref.watch(autoScrollCtrlProvider);
    final isLoading = useRef(false);

    useEffect(() {
      controller.addListener(() {
        if (controller.position.maxScrollExtent != controller.position.pixels) {
          return;
        }

        if (isLoading.value) return;

        isLoading.value = true;

        ref
            .read(messagesRepositoryProvider)
            .loadMoreMessages(chatId: chat.id)
            .then((value) => isLoading.value = false);
      });
      return null;
    }, []);

    return ListView.separated(
      controller: controller,
      reverse: true,
      itemBuilder: (ctx, index) => AutoScrollTag(
        index: index,
        key: ValueKey(index),
        controller: controller,
        child: VisibilityDetector(
          key: keys[index],
          child: MessageBoxContainer(
            messages: messages,
            message: messages[index],
            chat: chat,
          ),
          onVisibilityChanged: (info) => handler(info, index),
        ),
      ),
      itemCount: messages.length,
      separatorBuilder: buildMessagesDivider,
    );
  }

  Widget buildMessagesDivider(BuildContext context, int index) =>
      index < messages.length - 1 &&
              messages[index].sentAt.isOtherDay(messages[index + 1].sentAt)
          ? ChatMessagesDateSeparator(message: messages[index])
          : const SizedBox(height: 0);
}

final autoScrollCtrlProvider = Provider.autoDispose<AutoScrollController>(
  (ref) => AutoScrollController(
    axis: Axis.vertical,
  ),
);











































// GOVNO BLJAD EBANOE


    // final p = ref.watch(chattingProvidersProvider);
    // final itemPositionsListener = ref.watch(p.itemPositionsListenerProvider);

    // final nothingToLoad = useRef(false);
    // final offset = useRef(0);

    // listener() {
    //   if (nothingToLoad.value || messages.length < 50) return;

    //   final messageOnScreenIndex =
    //       itemPositionsListener.itemPositions.value.first.index;
    //   final isThreshold = messageOnScreenIndex > messages.length - 15;

    //   if (!isThreshold) return;

    //   ref
    //       .read(messagesRepositoryProvider)
    //       .loadMoreMessages(
    //         chatId: messages.first.chatId!,
    //         offset: offset.value + 1,
    //       )
    //       .then(
    //     (value) {
    //       nothingToLoad.value = value.isEmpty;
    //       offset.value = offset.value + 1;
    //     },
    //   );
    // }

    // useEffect(() {
    //   // itemPositionsListener.itemPositions.removeListener(listener);
    //   itemPositionsListener.itemPositions.addListener(listener);

    //   return () {};
    //   // return () => itemPositionsListener.itemPositions.removeListener(listener);
    // }, []);