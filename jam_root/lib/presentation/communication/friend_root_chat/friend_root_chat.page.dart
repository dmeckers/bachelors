import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/communication/state/messages_state.dart';
import 'package:jam/presentation/presentation.dart';

class FriendRootChatPage extends ConsumerWidget with ChattingProviders {
  const FriendRootChatPage({super.key, required this.chat});

  final ChatModel chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(
      currentChatStateProvider(chat.id).select((value) => value.state),
    );

    final m$ = ref.watch(messages$(chat));

    return ChatWrapper(
      chat: chat,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: ChatAppBar(chat: chat),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: m$.maybeWhen(
                  data: (data) {
                    final hasPinned = data.any((msg) => msg.isPinned);
                    return Column(
                      children: [
                        if (hasPinned)
                          PinnedMessagesTopBar(
                            messages: data,
                            chat: chat,
                          ),
                        Expanded(
                          child: ChatMessagesList(
                            chat: chat,
                            messages: data,
                          ),
                        ),
                      ],
                    );
                  },
                  orElse: () => const SizedBox(),
                ),
              ),
              if (chatState?.inputMode != ChatInputMode.standart)
                ChatExtraInputModeBar(
                  chatId: chat.id,
                  chatModel: chat,
                ),
              MessageInputBar(
                chatId: chat.id,
                contact: chat.relatedContact,
              )
            ],
          )
          // floatingActionButton: const ScrollDownFAB(),
          // floatingActionButtonLocation:
          //     const CustomFloatingActionButtonLocation(),
          ),
    );
  }
}
