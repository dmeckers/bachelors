import 'package:hive_flutter/hive_flutter.dart';
import 'package:jam/domain/domain.dart';

part 'chat_state_map.model.g.dart';

@HiveType(typeId: 10, adapterName: 'ChatStateMapAdapter')
class ChatStateMap extends HiveObject {
  ChatStateMap({required this.state});

  @HiveField(0)
  final Map<int, ChatState> state;
}
