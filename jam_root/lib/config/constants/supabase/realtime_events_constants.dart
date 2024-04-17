final class SupabaseChatRealTimeEventsContants {
  static const USER_TYPING_EVENT = 'USER_TYPING';
  static const USER_STOP_TYPING_EVENT = 'USER_STOP_TYPING';
  static const TRACK_CHAT_EVENT = 'TRACK_CHAT';
  static const UNTRACK_CHAT_EVENT = 'UNTRACK_CHAT';
  static const CLEAR_CHAT_HISTORY_EVENT = 'CLEAR_CHAT_HISTORY';
}

final class SupabaseMapRealTimeEventsConstants {
  static const JAM_CREATED_MAP_EVENT = 'JAM_CREATED';
  static const JAM_DELETED_MAP_EVENT = 'JAM_DELETED';
  static const JAM_UPDATED_MAP_EVENT = 'JAM_UPDATED';
  static const USER_CHANGED_MAP_VISIBILITY_MAP_EVENT =
      'USER_CHANGED_MAP_VISIBILITY';
  static const USER_UPDATED_VIBES_MAP_EVENT = 'USER_UPDATED_VIBES';
}

typedef ChatRealTime = SupabaseChatRealTimeEventsContants;
typedef MapRealTime = SupabaseMapRealTimeEventsConstants;
