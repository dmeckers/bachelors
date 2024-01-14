import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class ArchivedChatsTile extends StatelessWidget {
  const ArchivedChatsTile({super.key, required this.chats});

  final _UNREAD_MESSAGES_MIN_RADIUS = 10.0;
  final _UNREAD_MESSAGES_MAX_RADIUS = 10.0;
  final _TILE_ICON_RADIUS = 25.0;

  final List<ChatModel> chats;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: chats.any((element) => element.isArchived),
      child: ListTile(
        onTap: () => context.pushNamed(ChatRoutes.archivedChats.name),
        leading: CircleAvatar(
          radius: _TILE_ICON_RADIUS,
          backgroundColor: context.jTheme.disabledColor,
          child: const Icon(Icons.archive),
        ),
        subtitle: Text(
          chats
              .map(
                  (e) => e.relatedContact.fullName ?? e.relatedContact.username)
              .toList()
              .join(' ')
              .crop(70),
          style: context.jText.bodySmall,
        ),
        title: Text('Archive', style: context.jText.headlineMedium),
        trailing: CircleAvatar(
          backgroundColor: context.jTheme.disabledColor,
          minRadius: _UNREAD_MESSAGES_MAX_RADIUS,
          maxRadius: _UNREAD_MESSAGES_MIN_RADIUS,
          child: const Text(
            '0',
            style: TextStyle(fontSize: 11),
          ),
        ),
      ),
    );
  }

  // Widget _showUnreadMessages(BuildContext context) => Text(
  //     chats
  //         .where((element) => element.isArchived)
  //         .map((e) => e.unreadMessages)
  //         .fold(0, (previousValue, element) => previousValue + element)
  //         .toString(),
  //     style: context.jText.headlineSmall?.copyWith(fontSize: 10));
}
