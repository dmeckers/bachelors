import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class EventMessageBox extends ConsumerWidget with ChattingProviders {
  const EventMessageBox({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTapUp: (details) => _showMessagePopupMenu(context, ref, details),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          width: 200,
          height: 30,
          alignment: Alignment.center,
          color: Colors.black,
          child: Text(
            message.messageText ?? S.of(context).event,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _showMessagePopupMenu(
    BuildContext context,
    WidgetRef ref,
    TapUpDetails details,
  ) {
    final renderBox =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = renderBox.globalToLocal(details.globalPosition);
    showMenu(
      elevation: 2,
      context: context,
      position: RelativeRect.fromRect(
        position & const Size(100, 50),
        Offset.zero & renderBox.size,
      ),
      items: [
        PopupMenuItem(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.delete),
              ),
              const SizedBox(width: 5),
              Text(
                S.of(context).delete,
                style: context.jText.bodySmall,
              ),
            ],
          ),
          onTap: () => showDialog(
            context: context,
            builder: (ctx) => DestructiveDialog(
              onConfirm: (forEveryone) =>
                  ref.read(messagesRepositoryProvider).deleteMessage(
                        message: message,
                        forEveryone: forEveryone ?? false,
                      ),
              title: S.of(context).deleteMessage,
              subtitle: '',
              extraConditionMessage: S.of(context).deleteForEveryone,
            ),
          ),
        )
      ],
    );
  }
}
