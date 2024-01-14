// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class FriendRootChatPage extends ConsumerWidget with ChattingProviders {
  const FriendRootChatPage({super.key, required this.chat});

  final ChatModel chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(
      currentChatStateProvider(chat.id).select((value) => value.state),
    );

    return Scaffold(
      appBar: ChatAppBar(chat: chat),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        reverse: true,
        child: ChatWrapper(
          chat: chat,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ref.watch(getChatMessagesProvider(chat: chat)).maybeWhen(
                    data: (data) => data.any((msg) => msg.isPinned)
                        ? PinnedMessagesTopBar(
                            messages: data,
                            chat: chat,
                          )
                        : const SizedBox(),
                    orElse: () => const SizedBox(),
                  ),
              ref.watch(getChatMessagesProvider(chat: chat)).when(
                    data: (data) => ChatMessagesList(
                      chat: chat,
                      messages: data,
                    ),
                    error: (error, _) => const Center(
                      child: JamErrorBox(
                        errorMessage:
                            'Whoops! Something went wrong while loading the chat messages',
                      ),
                    ),
                    loading: () => const SizedBox(),
                  ),
              if (chatState?.inputMode == ChatInputMode.edit ||
                  chatState?.inputMode == ChatInputMode.reply)
                ChatExtraInputModeBar(chatId: chat.id),
              MessageInputBar(
                chatId: chat.id,
                contact: chat.relatedContact,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const ScrollDownFAB(),
      floatingActionButtonLocation: const CustomFloatingActionButtonLocation(),
    );
  }
}
