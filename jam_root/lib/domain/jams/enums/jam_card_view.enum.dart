import 'package:hive_flutter/hive_flutter.dart';

part 'jam_card_view.enum.g.dart';

@HiveType(typeId: 30)
enum JamCardView {
  @HiveField(0)
  small,
  @HiveField(2)
  big;
}
