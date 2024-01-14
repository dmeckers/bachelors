import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class MessageInputBar extends HookConsumerWidget
    with ChattingProviders, ProfileRepositoryProviders, SupabaseUserGetter {
  const MessageInputBar({
    super.key,
    required this.chatId,
    required this.contact,
  });

  final int chatId;
  final UserProfileModel contact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopTypingDebouncer = useDebouncer(
      duration: const Duration(seconds: 1),
    );

    _listenOnEditMode(ref);

    final chatState = ref.watch(
      currentChatStateProvider(chatId).select((value) => value.state),
    );

    final textInputController = ref.watch(userTextInputControllerProvider);

    final debounced = useDebouncer(duration: const Duration(seconds: 1));

    useEffect(() {
      if (chatState?.messageDraft?.isNotEmpty ?? false) {
        textInputController.text = chatState?.messageDraft as String;
      }
      return null;
    }, []);

    final isTyping = useState(false);

    return ChatMesssageInputBarWrapper(
      children: [
        IconButton(
          onPressed: () => debugPrint('Display stickers'),
          icon: const Icon(Icons.tag_faces_sharp),
        ),
        _buildBar(stopTypingDebouncer, isTyping, debounced),
        const ChatMessageInputBarAttachButton(),
        SendMessageButton(
          chatId: chatId,
          contact: contact,
        )
      ],
    );
  }

  Consumer _buildBar(
      Debouncer debouncer, ValueNotifier<bool> isTyping, Debouncer debounced) {
    return Consumer(
      builder: (context, ref, child) => Expanded(
        child: TextFormField(
          onChanged: (value) => _handleOnChanged(
            ref,
            debouncer,
            isTyping,
            value,
            debounced,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Message',
          ),
          keyboardType: TextInputType.multiline,
          style: context.jText.bodySmall,
          controller: ref.watch(userTextInputControllerProvider),
          maxLines: 6,
          minLines: 1,
          autocorrect: true,
        ),
      ),
    );
  }

  void _handleOnChanged(
    WidgetRef ref,
    Debouncer debouncer,
    ValueNotifier<bool> isTyping,
    String value,
    Debouncer debounced,
  ) {
    // store the message draft
    debounced(() {
      ref
          .read(currentChatStateProvider(chatId).notifier)
          .updateMessageDraft(value);
    });

    // fire typing event
    if (!isTyping.value) {
      ref.read(chatsEventsProvider).fireEvent(
            UserTypingInChatEvent(
              chatId,
              getUserIdOrThrow(),
            ),
          );
    }

    // isTyping.value = true;

    // // wait for 1 second before firing stop typing event
    debouncer(
      () {
        isTyping.value = false;
        ref.read(chatsEventsProvider).fireEvent(
              UserStopsTypingInChatEvent(
                chatId,
                getUserIdOrThrow(),
              ),
            );
      },
    );
  }

  void _listenOnEditMode(WidgetRef ref) {
    return ref.listen(
      currentChatStateProvider(chatId),
      (previous, next) {
        final newMode = next.state?.inputMode;
        final oldMode = previous?.state?.inputMode;
        final controller = ref.watch(userTextInputControllerProvider);
        final cache = ref.read(userTextInputFieldCache.notifier);

        final switchToEdit = newMode == ChatInputMode.edit &&
            (oldMode == ChatInputMode.standart ||
                oldMode == ChatInputMode.reply);

        final switchToStandart = (newMode == ChatInputMode.standart ||
                newMode == ChatInputMode.reply) &&
            oldMode == ChatInputMode.edit;

        if (switchToEdit) {
          cache.state = controller.text;
          controller.text = next.state?.model?.messageText ?? '';
        }

        if (switchToStandart) {
          controller.text = cache.state ?? '';
          cache.state = '';
        }
      },
    );
  }
}
