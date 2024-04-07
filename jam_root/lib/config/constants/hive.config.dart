final class HiveConstants {
  static const USERPROFILE_BOX_TYPE_ID = 2;
  static const LOCAL_DB_USER_PROFILE_KEY = 'profile';

  static const FRIEND_INVITES_BOX_TYPE_ID = 3;
  static const LOCAL_DB_FRIEND_INVITES_KEY = 'friend_invites';

  static const CHAT_BOX_TYPE_ID = 5;
  static const LOCAL_DB_CHAT_KEY = 'chats';

  static const REPLY_MESSAGE_BOX_TYPE = 6;
  static const LOCAL_DB_REPLY_MESSAGE_KEY = 'reply_messages';

  static const FORWARD_MESSAGE_BOX_TYPE = 7;
  static const FORWARD_MESSAGE_BOX_KEY = 'forward_messages';

  static const DEFAULT_MESSAGE_BOX_TYPE = 8;
  static const LOCAL_DB_DEFAULT_MESSAGE_KEY = 'default_messages';

  ///
  /// must be appended with chat id
  ///
  static const CHAT_STATE_BOX_TYPE = 10;
  static const LOCAL_DB_CHAT_STATE_KEY = 'chat_state';

  static const USER_PRIVACY_SETTINGS_BOX_TYPE_ID = 25;
  static const LOCAL_DB_USER_PRIVACY_SETTINGS_KEY = 'user_privacy';

  static const JAM_CARD_VIEW_BOX_TYPE_ID = 30;
  static const LOCAL_DB_JAM_CARD_VIEW_KEY = 'jam_card_view';

  static const LAST_MESSAGE_BOX_TYPE_ID = 63;

  static getAllKeys() {
    return [
      LOCAL_DB_USER_PROFILE_KEY,
      LOCAL_DB_FRIEND_INVITES_KEY,
      LOCAL_DB_CHAT_KEY,
      LOCAL_DB_REPLY_MESSAGE_KEY,
      LOCAL_DB_DEFAULT_MESSAGE_KEY,
      LOCAL_DB_CHAT_STATE_KEY,
      LOCAL_DB_USER_PRIVACY_SETTINGS_KEY,
      LOCAL_DB_JAM_CARD_VIEW_KEY,
    ];
  }
}
