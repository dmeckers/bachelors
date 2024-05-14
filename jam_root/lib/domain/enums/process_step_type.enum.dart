import 'package:hive_flutter/hive_flutter.dart';

part 'process_step_type.enum.g.dart';

@HiveType(typeId: 64)
enum ProcessStepTypeEnum {
  @HiveField(0)
  pending,
  @HiveField(1)
  accepted,
  @HiveField(2)
  declined,
  @HiveField(3)
  freezed,
  @HiveField(4)
  hidden,
}
