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
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 6),
        Visibility(
          visible: message.isPinned,
          child: Transform.rotate(
            angle: 0.8,
            child: const Icon(
              Icons.push_pin_outlined,
              size: 11,
            ),
          ),
        ),
        Visibility(
          visible: message.isPinned,
          child: const SizedBox(width: 6),
        ),
        Visibility(
            visible: message.isEdited,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                'Edited',
                style: context.jText.bodySmall?.copyWith(fontSize: 8),
              ),
            )),
        Visibility(visible: message.isEdited, child: const SizedBox(width: 6)),
        Text(
          message.sentAt.toTime(),
          style: context.jText.bodySmall?.copyWith(fontSize: 11),
        ),
        const SizedBox(width: 6),
        Icon((message.messageStatus?.toIcon()), size: 11)
      ],
    );
  }
}
