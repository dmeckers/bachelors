import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class ChatInputBarBase extends HookConsumerWidget {
  const ChatInputBarBase({
    super.key,
    required this.chatId,
    this.onChanged,
    this.controller,
    this.contact,
    this.jam,
    this.onSend,
  }) : assert(contact != null || jam != null);

  final int chatId;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final UserProfileModel? contact;
  final JamModel? jam;
  final void Function(String)? onSend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEdittingController = useTextEditingController();

    return ChatMesssageInputBarWrapper(
      children: [
        IconButton(
          onPressed: () => debugPrint('Display stickers'),
          icon: const Icon(Icons.tag_faces_sharp),
        ),
        Flexible(
          child: TextFormField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Message',
            ),
            keyboardType: TextInputType.multiline,
            style: context.jText.bodySmall,
            controller: controller ?? textEdittingController,
            maxLines: 6,
            minLines: 1,
            autocorrect: true,
          ),
        ),
        const ChatMessageInputBarAttachButton(),
        contact.isNotNull
            ? SendMessageButton(
                chatId: chatId,
                contact: contact!,
              )
            : IconButton(
                onPressed: () {
                  onSend?.call(controller?.text ?? textEdittingController.text);
                  controller?.clear();
                  textEdittingController.clear();
                },
                icon: const Icon(Icons.send),
              )
      ],
    );
  }
}
