import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jam/application/application.dart';
import 'package:jam/data/attachments/local_attachments_service.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam_ui/jam_ui.dart';

class ChatPopupMenu extends ConsumerWidget with ChattingProviders {
  const ChatPopupMenu({super.key, required this.chat});

  final ChatModel chat;

  static const personContactMenuContentMap = {
    PersonalChatAppBarPopupMenuActions.mute: (Icons.volume_up, 'Mute'),
    PersonalChatAppBarPopupMenuActions.deleteChat: (
      Icons.delete,
      'Delete chat'
    ),
    PersonalChatAppBarPopupMenuActions.clearHistory: (
      Icons.delete,
      'Clear history'
    ),
    PersonalChatAppBarPopupMenuActions.search: (Icons.search, 'Search'),
    PersonalChatAppBarPopupMenuActions.changeBackground: (
      Icons.wallpaper,
      'Change background'
    ),
  };

  List<PopupMenuItem<PersonalChatAppBarPopupMenuActions>> _buildItems(
      BuildContext context) {
    return PersonalChatAppBarPopupMenuActions.values
        .map(
          (e) => PopupMenuItem(
            value: e,
            child: Row(
              children: [
                Icon(personContactMenuContentMap[e]!.$1),
                const SizedBox(width: 5),
                Text(
                  personContactMenuContentMap[e]!.$2,
                  style: context.jText.headlineSmall,
                )
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = _buildItems(context);
    final halfScreenWidth = MediaQuery.of(context).size.width * 0.5;

    return PopupMenuButton(
      elevation: 0,
      position: PopupMenuPosition.over,
      constraints: BoxConstraints(minWidth: halfScreenWidth),
      itemBuilder: (context) => items,
      onSelected: (PersonalChatAppBarPopupMenuActions action) {
        switch (action) {
          case PersonalChatAppBarPopupMenuActions.clearHistory:
            _openClearHistoryDialog(context, ref);
            break;
          case PersonalChatAppBarPopupMenuActions.deleteChat:
            _openDeleteChatDialog(context, ref);
            break;
          case PersonalChatAppBarPopupMenuActions.mute:
            _handleMuteChat(context, ref);
            break;
          case PersonalChatAppBarPopupMenuActions.search:
            _handleSearch(context, ref);
            break;
          case PersonalChatAppBarPopupMenuActions.changeBackground:
            _handleUpdateBackground(context, ref);
            break;
        }
      },
      icon: const Icon(Icons.more_vert, color: Colors.black87),
    );
  }

  void _handleUpdateBackground(BuildContext context, WidgetRef ref) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    await ref.read(chatBackgroundProvider(chat).notifier).upsertImage(
          File(pickedImage.path),
        );
  }

  void _handleMuteChat(BuildContext context, WidgetRef ref) {
    //TODO implement
  }

  void _handleSearch(BuildContext context, WidgetRef ref) {
    //TODO implement
  }

  _openClearHistoryDialog(BuildContext context, WidgetRef ref) async {
    await showDialog(
      context: context,
      builder: (_) => DestructiveDialog(
        title: 'Clear history',
        subtitle: 'Are you sure you want to clear history?',
        confirmMessage: 'Clear',
        onConfirm: (forEveryone) {
          ref.read(
            clearChatMessagesProvider(
              chatId: chat.id,
              forEveryone: forEveryone ?? false,
            ),
          );
        },
        extraConditionMessage: 'Also clear for ${chat.relatedContact.username}',
      ),
    );
  }

  _openDeleteChatDialog(BuildContext context, WidgetRef ref) async {
    await showDialog(
      context: context,
      builder: (_) => DestructiveDialog(
        title: 'Delete chat',
        subtitle: 'Are you sure you want to delete chat?',
        confirmMessage: 'Delete',
        //todo rework this
        onConfirm: (forBoth) {
          // ref
          //     .read(messagesControllerProvider)
          //     .deleteChat(chatId: int.tryParse(chatId ?? '1') ?? 1, forBoth: forBoth ?? false);
        },
        extraConditionMessage: 'Also delete for this user',
      ),
    );
  }
}
