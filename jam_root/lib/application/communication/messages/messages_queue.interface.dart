import 'package:jam/domain/domain.dart';

abstract class MessagesQueueInterface {
  Future<MessageModel> queueSendText({
    required int chatId,
    required MessageModel message,
    required UserProfileModel receiver,
  });

  Future<void> queueUpdate({
    required MessageModel message,
    required UserProfileModel receiver,
  });

  Future queueDelete({
    required MessageModel message,
    required bool forEveryone,
  });

  Future queuePin({
    required MessageModel message,
    required bool forEveryone,
  });

  Future queueUnpinAll({required int chatId});

  Future queueUnpin({required MessageModel message});

  Future<void> queueClearChatMessages({
    required int chatId,
    required bool forEveryone,
  });
}
