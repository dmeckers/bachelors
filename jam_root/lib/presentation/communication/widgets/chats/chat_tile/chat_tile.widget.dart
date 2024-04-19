import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class ChatTile extends ConsumerWidget with ChattingProviders {
  final ChatModel chatModel;
  final MAX_MESSAGE_LENGTH = 50;
  const ChatTile({
    super.key,
    required this.chatModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    final chatState = ref.watch(
        currentChatStateProvider(chatModel.id).select((value) => value.state));

    return Dismissible(
      direction: DismissDirection.endToStart,
      dismissThresholds: const {
        DismissDirection.endToStart: 0.5,
      },
      onDismissed: (direction) async {
        chatModel.isArchived
            ? ref
                .read(chatsStateProvider)
                .unarchiveChats(selectedChats: [chatModel])
            : ref
                .read(chatsStateProvider)
                .archiveChats(selectedChats: [chatModel]);
      },
      background: Container(
        color: Colors.blue,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              chatModel.isArchived ? S.of(context).unarchive : S.of(context).archive,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.unarchive, color: Colors.white),
          ],
        ),
      ),
      key: Key("${chatModel.id}"),
      child: ListTile(
        tileColor: chatModel.isPinned
            ? context.jTheme.colorScheme.secondaryContainer
            : context.jTheme.colorScheme.primaryContainer,
        onLongPress: () => _handleOnLongPress(ref, selectedChats),
        onTap: () => _handleOnTap(context, ref, selectedChats),
        leading: ChatTileLeading(
          isSelected: selectedChats.contains(chatModel),
          friend: chatModel.relatedContact,
        ),
        title: _showChatTitle(context),
        subtitle: _showChatLastMessage(context, chatState),
        trailing: ChatTileTrailing(chatModel: chatModel),
      ),
    );
  }

  void _handleOnLongPress(WidgetRef ref, List<ChatModel> selectedChats) {
    if (selectedChats.isEmpty) {
      ref.read(selectedChatsProvider.notifier).state = [chatModel];
      return;
    }

    _toggleChatSelection(ref, selectedChats);
  }

  void _handleOnTap(
    BuildContext context,
    WidgetRef ref,
    List<ChatModel> selectedChats,
  ) {
    if (selectedChats.isEmpty) {
      context.pushNamed(
        ChatRoutes.chat.name,
        pathParameters: {
          "${ChatRoutes.chat.pathParameter}": chatModel.id.toString()
        },
        extra: chatModel,
      );
      return;
    }

    _toggleChatSelection(ref, selectedChats);
  }

  void _toggleChatSelection(WidgetRef ref, List<ChatModel> selectedChats) {
    ref.read(selectedChatsProvider.notifier).state = selectedChats
            .contains(chatModel)
        ? selectedChats.where((element) => element.id != chatModel.id).toList()
        : [...selectedChats, chatModel];
  }

  Widget _showChatLastMessage(BuildContext context, ChatState? state) {
    final lastMessage = chatModel.lastMessage;
    // final chatState = chatModel.state;
    if (chatModel.chatEventType == ChatEventType.typing) {
      return Text(
        S.of(context).typing,
        style: context.jText.bodySmall?.copyWith(fontStyle: FontStyle.italic),
      );
    }

    // Show this if the last message is not from the current user
    if (lastMessage != null && !lastMessage.fromMe) {
      return RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "${chatModel.relatedContact.username} \t",
            style:
                context.jText.bodySmall?.copyWith(fontStyle: FontStyle.italic),
          ),
          TextSpan(
            text: _messageDescirption(lastMessage),
            style: context.jText.bodySmall,
          ),
        ]),
      );
    }

    // Show this if the last message is from the current user and there is a draft
    if (state != null &&
        ((state.messageDraft?.isNotEmpty ?? false) ||
            (state.inputMode == ChatInputMode.reply))) {
      return RichText(
          text: TextSpan(children: [
        TextSpan(
          text: S.of(context).draft,
          style: context.jText.bodySmall
              ?.copyWith(fontStyle: FontStyle.italic, color: Colors.red[400]),
        ),
        TextSpan(
          text: state.messageDraft ?? '',
          style: context.jText.bodySmall,
        )
      ]));
    }

    // Show this if the last message is from the current user without a draft
    if (lastMessage != null) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'You: ',
              style: context.jText.bodySmall
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
            TextSpan(
              text: _messageDescirption(lastMessage),
              style: context.jText.bodySmall,
            ),
          ],
        ),
      );
    }

    // Show this if there is no last message
    return Text(
      'History is cleared',
      style: context.jText.bodySmall?.copyWith(fontStyle: FontStyle.italic),
    );
  }

  Row _showChatTitle(BuildContext context) => Row(
        children: [
          Text(
            chatModel.relatedContact.username ?? 'User',
            style: context.jText.headlineMedium,
          ),
          // Visibility(
          //     visible: chatModel.isMuted,
          //     child: const Padding(
          //       padding: EdgeInsets.only(left: 5),
          //       child: Icon(
          //         Icons.volume_off,
          //         color: Color.fromARGB(255, 130, 129, 129),
          //         size: 15,
          //       ),
          //     ))
        ],
      );

  String _messageDescirption(LastMessageModel message) =>
      switch (message.messageType) {
        MessageType.audio_message => 'Audio message',
        MessageType.text ||
        MessageType.event =>
          message.messageText!.crop(MAX_MESSAGE_LENGTH),
        MessageType.image => 'Image',
        MessageType.file => 'File',
        _ => 'Other'
      };
}
