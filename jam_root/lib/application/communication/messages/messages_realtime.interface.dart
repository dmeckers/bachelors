import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

abstract class MessagesRealtimeInterface
    implements RealtimeInterface<List<MessageModel>, ChatModel> {
  void pushMessages(List<MessageModel> messages);
  void pushMessage(MessageModel message);
  void pushUpdateMessage(MessageModel message);
  void pushDeleteMessage(MessageModel message);
  void pushUnpinAllMessages();
}
