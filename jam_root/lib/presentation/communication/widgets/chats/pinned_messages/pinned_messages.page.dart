import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';

class PinnedMessagesPage extends ConsumerWidget with ChattingProviders {
  const PinnedMessagesPage({super.key, required this.chat});

  final ChatModel chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinnedMessages$ = ref.watch(getPinnedMessagesProvider(chat: chat));

    return Scaffold(
      appBar: SimpleAppBar(title: S.of(context).pinnedMessages),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: pinnedMessages$.when(
              data: (pinnedMessages) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: pinnedMessages.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Align(
                        alignment: pinnedMessages[index].fromMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: ActionlessMessageBox(
                          message: pinnedMessages[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => JamErrorBox(
                errorMessage:
                    S.of(context).CouldntLoadMessagesTryAgain,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              ref
                  .read(messagesRepositoryProvider)
                  .unpinAllMessages(chatId: chat.id);

              Navigator.of(context).pop();
            },
            tileColor: Colors.black,
            title: Text(
              S.of(context).unpinAllMessages,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
