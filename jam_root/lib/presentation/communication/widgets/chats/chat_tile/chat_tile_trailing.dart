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

    return SizedBox(
      width: 45,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (lastMessage != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    lastMessage.messageStatus?.toIcon(),
                    size: 15,
                  ),
                  const SizedBox(width: 4),
                  Text(lastMessage.sentAt.toNTimeAgo),
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

  Widget _buildPinnedIcon(BuildContext context) => Transform.rotate(
        angle: 45 * pi / 180,
        child: const CircleAvatar(
          maxRadius: 12,
          minRadius: 10,
          child: Icon(
            Icons.push_pin_outlined,
            size: 14,
          ),
        ),
      );
}
