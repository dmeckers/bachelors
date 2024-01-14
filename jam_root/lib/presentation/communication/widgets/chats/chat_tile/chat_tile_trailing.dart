import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class ChatTileTrailing extends StatelessWidget with ChattingProviders {
  const ChatTileTrailing({super.key, required this.chatModel});

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    final lastMessage = chatModel.lastMessage;
    if (lastMessage == null) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }

    if (lastMessage.fromMe) {
      return _buildMessageFromMe(context, lastMessage);
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chatModel.lastMessage?.sentAt.toNTimeAgo() ?? 'Recently',
          ),
          const SizedBox(height: 2),
          if (chatModel.isPinned) _buildPinnedIcon(context)
        ],
      ),
    );
  }

  Widget _buildPinnedIcon(BuildContext context) => Transform.rotate(
        angle: 45 * pi / 180,
        child: const CircleAvatar(
          // backgroundColor: chatModel.isMuted
          //     ? context.jTheme.disabledColor
          //     : context.jTheme.colorScheme.onPrimaryContainer,
          // backgroundColor: context.jTheme.colorScheme.onPrimaryContainer,
          maxRadius: 12,
          minRadius: 10,
          child: Icon(
            Icons.push_pin_outlined,
            size: 14,
          ),
        ),
      );

  SizedBox _buildMessageFromMe(
    BuildContext context,
    LastMessageModel lastMessage,
  ) {
    return SizedBox(
      width: 120,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  lastMessage.messageStatus?.toIcon(),
                  size: 15,
                ),
                const SizedBox(width: 4),
                Text(lastMessage.sentAt.toNTimeAgo()),
              ],
            ),
            if (chatModel.isPinned)
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: _buildPinnedIcon(context),
              )
          ],
        ),
      ),
    );
  }
}
