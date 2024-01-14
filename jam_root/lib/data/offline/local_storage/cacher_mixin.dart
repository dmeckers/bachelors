import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

mixin class Storer {
  static const Map<Type, String> _typeKeys = {
    UserProfileModel: HiveConstants.LOCAL_DB_USER_PROFILE_KEY,
    FriendInviteModel: HiveConstants.LOCAL_DB_FRIEND_INVITES_KEY,
    ChatModel: HiveConstants.LOCAL_DB_CHAT_KEY,
    Map<int, ChatState>: HiveConstants.LOCAL_DB_CHAT_STATE_KEY,
    UserProfilePrivacySettingsModel:
        HiveConstants.LOCAL_DB_USER_PRIVACY_SETTINGS_KEY,
    JamCardView: HiveConstants.LOCAL_DB_JAM_CARD_VIEW_KEY,
  };

  Future<void> store<T>(T value) async {
    await localDatabase.put(_typeKeys[T], value);
  }

  Future<T> storeAndReturn<T>(T value) async {
    await store<T>(value);
    return value;
  }

  T? get<T>() {
    return localDatabase.get(_typeKeys[T]);
  }

  void remove<T>() {
    localDatabase.delete(_typeKeys[T]);
  }

  refresh<T>(T value) async {
    remove<T>();
    await store<T>(value);
  }

  Future<T> refreshAndReturn<T>(T value) async {
    await refresh<T>(value);
    return value;
  }
}
