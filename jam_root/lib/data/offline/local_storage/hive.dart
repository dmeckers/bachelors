import 'package:hive_flutter/hive_flutter.dart';

import 'package:jam/domain/domain.dart';

late Box localDatabase;

final class HiveService {
  static initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProfileModelAdapter());
    Hive.registerAdapter(FriendInviteModelAdapter());
    Hive.registerAdapter(ChatModelAdapter());
    Hive.registerAdapter(DefaultMessageModelAdapter());
    Hive.registerAdapter(ChatStateMapAdapter());
    Hive.registerAdapter(ChatStateAdapter());
    Hive.registerAdapter(ChatInputModeAdapter());
    Hive.registerAdapter(MessageTypeAdapter());
    Hive.registerAdapter(VibeModelImplAdapter());
    Hive.registerAdapter(UserProfilePrivacySettingsModelAdapter());
    Hive.registerAdapter(PrivacyBoundariesAdapter());
    Hive.registerAdapter(JamCardViewAdapter());
    Hive.registerAdapter(MessagePinStateAdapter());
    Hive.registerAdapter(LastMessageModelAdapter());
    Hive.registerAdapter(MessageDeliveryStatusAdapter());
    Hive.registerAdapter(JamModelAdapter());
    Hive.registerAdapter(JamJoinTypeEnumAdapter());
    Hive.registerAdapter(JamQrModeEnumAdapter());
    Hive.registerAdapter(MapDataImplAdapter());
    Hive.registerAdapter(JamLocationImplAdapter());
    Hive.registerAdapter(UserLocationImplAdapter());
    Hive.registerAdapter(LatLngAdapter());

    localDatabase = await Hive.openBox('localDatabase');
  }
}
