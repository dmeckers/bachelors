import 'package:flutter/services.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
Future sendTextMessage(
  SendTextMessageRef ref,
  int chatId,
  UserProfileModel contact,
) async {
  final p = ref.read(chattingProvidersProvider);
  final inputNotifier = ref.read(p.userTextInputControllerProvider.notifier);

  final replyToMessage = ref.read(
    p.currentChatStateProvider(chatId).select((value) => value.state?.model),
  );

  final newMessageText = inputNotifier.state.text;

  final message = MessageModel(
    messageType: MessageType.text,
    messageText: newMessageText,
    sentAt: DateTime.now(),
    repliedTo: replyToMessage?.id,
    repliedToDate: replyToMessage?.sentAt,
    fromMe: true,
  );

  inputNotifier.state.clear();
  ref.read(p.currentChatStateProvider(chatId).notifier).clear();

  ref.read(
    p.sendDeafultTextMessageProvider(
      message: message,
      chatId: chatId,
      receiver: contact,
    ),
  );
}

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
