import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

enum ChatBoxPopupMenuActions { reply, copy, forward, pin, unpin, edit, delete }

class MessageBoxActionButtonsWrapper extends HookConsumerWidget
    with ChattingProviders {
  const MessageBoxActionButtonsWrapper({
    super.key,
    required this.child,
    required this.message,
  });

  final Widget child;
  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMessages = ref.watch(selectedMessagesProvider);

    return GestureDetector(
      onLongPress: () => _handleLongTap(
        selectedMessages,
        ref,
      ),
      onTapUp: (details) => _handleTapUp(
        context,
        details,
        selectedMessages,
        ref,
      ),
      child: child,
    );
  }

  _handleLongTap(List<MessageModel> selectedMessages, WidgetRef ref) {
    if (selectedMessages.isEmpty) {
      return ref.read(selectedMessagesProvider.notifier).state = [message];
    }

    if (selectedMessages.contains(message)) {
      return ref.read(selectedMessagesProvider.notifier).state =
          selectedMessages.where((e) => e.id != message.id).toList();
    }

    ref.read(selectedMessagesProvider.notifier).state = [
      ...selectedMessages,
      message
    ];
  }

  _handleTapUp(BuildContext context, TapUpDetails details,
      List<MessageModel> selectedMessages, WidgetRef ref) {
    if (selectedMessages.isEmpty) {
      return _showMessagePopupMenu(context, ref, details);
    }

    if (selectedMessages.contains(message)) {
      return ref.read(selectedMessagesProvider.notifier).state =
          selectedMessages.where((e) => e.id != message.id).toList();
    }

    ref.read(selectedMessagesProvider.notifier).state = [
      ...selectedMessages,
      message
    ];
  }

  _showMessagePopupMenu(
    BuildContext context,
    WidgetRef ref,
    TapUpDetails details,
  ) {
    final renderBox =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    // todo check on this one
    final position = renderBox.globalToLocal(details.globalPosition);
    showMenu(
      elevation: 2,
      context: context,
      position: RelativeRect.fromRect(
          position & const Size(100, 50), Offset.zero & renderBox.size),
      items: _buildPopupMenuItems(context, ref),
    );
  }

  List<PopupMenuEntry<ChatBoxPopupMenuActions>> _buildPopupMenuItems(
      BuildContext context, WidgetRef ref) {
    return [
      PopupMenuItem(
        value: ChatBoxPopupMenuActions.reply,
        child: _buildPopupMenuItemContent(context, 'Reply', Icons.reply),
        onTap: () {
          ref
              .read(currentChatStateProvider(message.chatId!).notifier)
              .updateChatInputMode(ChatInputMode.reply, message);
        },
      ),
      if (message.messageType == MessageType.text)
        PopupMenuItem(
          value: ChatBoxPopupMenuActions.copy,
          child: _buildPopupMenuItemContent(context, 'Copy', Icons.copy),
          onTap: () async => await Clipboard.setData(
              ClipboardData(text: message.messageText!)),
        ),
      if (message.isPinned)
        PopupMenuItem(
          value: ChatBoxPopupMenuActions.unpin,
          child: _buildPopupMenuItemContent(context, 'Unpin', Icons.push_pin),
          onTap: () async {
            return await ref
                .read(messagesRepositoryProvider)
                .unpinMessage(message: message);
          },
        ),
      if (!message.isPinned)
        PopupMenuItem(
          value: ChatBoxPopupMenuActions.pin,
          child: _buildPopupMenuItemContent(context, 'Pin', Icons.push_pin),
          onTap: () async => await showDialog(
            context: context,
            builder: (context) => PinMessageDialog(
              message: message,
            ),
          ),
        ),
      if (message.fromMe)
        PopupMenuItem(
          value: ChatBoxPopupMenuActions.edit,
          child: _buildPopupMenuItemContent(context, 'Edit', Icons.edit),
          onTap: () => ref
              .read(currentChatStateProvider(message.chatId!).notifier)
              .updateChatInputMode(ChatInputMode.edit, message),
        ),
      PopupMenuItem(
        value: ChatBoxPopupMenuActions.delete,
        child: _buildPopupMenuItemContent(context, 'Delete', Icons.delete),
        onTap: () async => await showDialog(
          context: context,
          builder: (context) => DeleteMessageDialog(
            message: message,
          ),
        ),
      ),
    ];
  }

  _buildPopupMenuItemContent(
    BuildContext context,
    String title,
    IconData icon,
  ) =>
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(icon),
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: context.jText.bodySmall,
          ),
        ],
      );
}
