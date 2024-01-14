import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class EventMessageBox extends ConsumerWidget with ChattingProviders {
  const EventMessageBox({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTapUp: (details) => _showMessagePopupMenu(context, ref, details),
      child: _buildBox(),
    );
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
                'Delete',
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
              title: 'Delete message',
              subtitle: '',
              extraConditionMessage: 'Delete for everyone',
            ),
          ),
        )
      ],
    );
  }

  Container _buildBox() {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 200,
          height: 30,
          alignment: Alignment.center,
          color: Colors.black,
          child: Text(
            message.messageText ?? 'Event',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
