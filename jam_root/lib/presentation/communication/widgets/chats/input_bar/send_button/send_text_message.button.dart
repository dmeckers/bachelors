import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class SendTextMessageButton extends ConsumerWidget with ChattingProviders {
  const SendTextMessageButton({
    super.key,
    required this.chatId,
    required this.contact,
  });

  final int chatId;
  final UserProfileModel contact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(sendTextMessageProvider(chatId, contact)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Icon(Icons.send),
      ),
    );
  }
}
