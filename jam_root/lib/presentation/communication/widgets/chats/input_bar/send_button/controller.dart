import 'package:flutter/services.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
Future sendEdittedTextMessage(
  SendEdittedTextMessageRef ref,
  int chatId,
  UserProfileModel contact,
  MessageModel editable,
) async {
  final p = ref.read(chattingProvidersProvider);
  final inputNotifier = ref.read(p.userTextInputControllerProvider.notifier);

  if (inputNotifier.state.text.isEmpty) {
    HapticFeedback.vibrate();
    return;
  }

  ref.read(messagesRepositoryProvider).updateMessage(
        message: editable.copyWith(messageText: inputNotifier.state.text),
        receiver: contact,
      );

  ref.invalidate(p.currentChatStateProvider(chatId));
  ref.invalidate(p.userTextInputControllerProvider);
}
