import 'package:hive/hive.dart';

@HiveType(typeId: 32)
enum JamQrModeEnum {
  @HiveField(0)
  none,
  @HiveField(1)
  creatorChecksIn,
  @HiveField(2)
  participantsCheckInThemself;
}
