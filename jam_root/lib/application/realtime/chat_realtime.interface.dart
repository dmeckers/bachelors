import 'package:jam/application/application.dart';

import 'package:jam/domain/domain.dart';

abstract class ChatRealtimeInterface {
  abstract final ChatRepositoryInterface repository;

  Stream<List<ChatModel>> get$();
}
