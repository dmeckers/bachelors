import 'package:flutter_hooks/flutter_hooks.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum VisibilityDetectionActions { watchForPinnedMessages }

typedef MessageVibilityHandler = void Function(
  VisibilityInfo info,
  int index,
);

mixin ChatScrollHelper {
  MessageVibilityHandler getMessageObserverHandler(
    WidgetRef ref,
    Messages messages,
    int chatId,
  ) {
    final pinned = [...messages.where((element) => element.isPinned)];
    final cp = ref.watch(chattingProvidersProvider);
    final pinnedToShowProvider = cp.lastVisiblePinnedMessageProvider;

    return (VisibilityInfo visibilityInfo, int messageIndex) {
      if (pinned.isEmpty) return;
      final isVisible = visibilityInfo.visibleFraction == 1;
      final noPinnedBelow = messages.indexOf(pinned.first) < messageIndex;
      final noPinnedAbove = messages.indexOf(pinned.last) > messageIndex;

      /// e.g. current tracked message index is 5
      /// and first pinned message is at index 7
      /// then we should show the first pinned message
      if (isVisible && noPinnedBelow) {
        ref.read(pinnedToShowProvider(chatId).notifier).state = pinned.first;
        return;
      }

      /// e.g. current tracked message index is 20
      /// and last pinned message is at index 15
      /// then we should show the last pinned message
      if (isVisible && noPinnedAbove) {
        ref.read(pinnedToShowProvider(chatId).notifier).state = pinned.last;
        return;
      }

      ///
      /// gotta comprehense this
      ///
      if (isVisible && pinned.length > 1 && messageIndex > 1) {
        ref.read(cp.lastVisiblePinnedMessageProvider(chatId).notifier).state =
            messages.lastWhere(
          (element) =>
              (messages.indexOf(element) < messageIndex - 1) &&
              element.isPinned,
          orElse: () => pinned.first,
        );
      }
    };
  }

  messageObserverLazyLoad(
    WidgetRef ref,
    Messages messages,
    ChatModel chat,
  ) {
    final p = ref.watch(chattingProvidersProvider);
    final itemPositionsListener = ref.watch(p.itemPositionsListenerProvider);

    final nothingToLoad = useRef(false);
    final messagesLoaded = useRef(false);
    // final offset = useRef(0);

    final listener = useCallback(
      () {
        if (messages.length < 50) return;

        final messageOnScreenIndex =
            itemPositionsListener.itemPositions.value.first.index;
        final isThreshold = messageOnScreenIndex > messages.length - 15;

        if (nothingToLoad.value || messagesLoaded.value || !isThreshold) return;
        messagesLoaded.value = true;

        // ref
        //     .read(messagesRepositoryProvider)
        //     .loadMoreMessages(chat: chat, offset: offset.value)
        //     .then(
        //   (value) {
        //     nothingToLoad.value = value.isEmpty;
        //     offset.value = offset.value + 1;
        //   },
        // );
      },
    );

    useEffect(() {
      messagesLoaded.value = false;

      itemPositionsListener.itemPositions.addListener(listener);

      return () => itemPositionsListener.itemPositions.removeListener(listener);
    }, [messages]);
  }
}
