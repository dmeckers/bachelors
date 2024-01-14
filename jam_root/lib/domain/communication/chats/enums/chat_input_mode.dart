import 'package:hive/hive.dart';

part 'chat_input_mode.g.dart';

@HiveType(typeId: 13)
enum ChatInputMode {
  @HiveField(0)
  forward,
  @HiveField(1)
  reply,
  @HiveField(2)
  edit,
  @HiveField(3)
  standart,
}
