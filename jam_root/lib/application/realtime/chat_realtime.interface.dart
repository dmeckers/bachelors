import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

abstract class ChatRealtimeInterface
    implements RealtimeInterface<Chats, List<ChatModel>> {}
