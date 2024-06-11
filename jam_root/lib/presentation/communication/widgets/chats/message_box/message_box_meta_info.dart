import 'package:flutter/material.dart';
import 'package:jam/domain/domain.dart';

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
      children: [
        const SizedBox(width: 6),
        iconIfPinned(),
        if (message.isPinned) const SizedBox(width: 6),
        infoIfEdited(context),
        if (message.isEdited) const SizedBox(width: 6),
        timeWhenSent(context),
        const SizedBox(width: 6),
        if (message.fromMe) Icon((message.messageStatus?.toIcon()), size: 11)
      ],
    );
  }

  Widget iconIfPinned() => message.isPinned
      ? Transform.rotate(
          angle: 0.8,
          child: const Icon(
            Icons.push_pin_outlined,
            size: 11,
          ),
        )
      : const SizedBox();

  infoIfEdited(BuildContext context) => message.isEdited
      ? Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(
            'Edited',
            style: context.jText.bodySmall?.copyWith(fontSize: 8),
          ),
        )
      : const SizedBox();

  timeWhenSent(BuildContext context) {
    return Text(
      message.sentAt.atTime,
      style: context.jText.bodySmall?.copyWith(fontSize: 11),
    );
  }
}
