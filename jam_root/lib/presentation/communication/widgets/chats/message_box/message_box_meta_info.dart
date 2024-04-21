import 'package:flutter/material.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';

import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class MessageBoxMetaInfo extends StatelessWidget {
  const MessageBoxMetaInfo({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 6),

        /// pinned part
        if (message.isPinned)
          Transform.rotate(
            angle: 0.8,
            child: const Icon(
              Icons.push_pin_outlined,
              size: 11,
            ),
          ),
        if (message.isPinned) const SizedBox(width: 6),

        /// edited part
        if (message.isEdited)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              S.of(context).edited,
              style: context.jText.bodySmall?.copyWith(fontSize: 8),
            ),
          ),
        if (message.isEdited) const SizedBox(width: 6),

        /// time
        Text(
          message.sentAt.toTime(),
          style: context.jText.bodySmall?.copyWith(fontSize: 11),
        ),
        const SizedBox(width: 6),

        /// status part
        if (message.fromMe) Icon((message.messageStatus?.toIcon()), size: 11)
      ],
    );
  }
}
