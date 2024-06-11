final class _SupabaseFunctionsConstants {
  static const SEND_JAM_FORM_SUBMITTED_NOTIFICATION =
      'send_jam_form_submitted_notification';
  static const SEND_INVITE_JAM_NOTIFICATION = 'send_invite_jam_notification';
  static const SEND_FRIEND_INVITE_NOTIFICATIONS =
      'send_friend_invite_notifications';
  static const SEND_MESSAGE_NOTIFICATION = 'send_message_notification';
  static const SEND_JAM_FORM_SUBMITTED_JOINED_NOTIFICATION =
      'send_jam_form_submitted_joined_notification';

  static const SEND_JAM_REQUEST_ACCEPTED_NOTIFICATION =
      'send_jam_request_accepted_notification';
}

enum NotificationTypeEnum {
  sendJamFormSubmittedNotification,
  sendInviteJamNotification,
  sendFriendInviteNotifications,
  sendMessageNotification,
  sendJamRequestAcceptedNotification,
  sendJamFormSubmittedJoinedNotification;

  String get value {
    return switch (this) {
      NotificationTypeEnum.sendJamFormSubmittedNotification =>
        _SupabaseFunctionsConstants.SEND_JAM_FORM_SUBMITTED_NOTIFICATION,
      NotificationTypeEnum.sendInviteJamNotification =>
        _SupabaseFunctionsConstants.SEND_INVITE_JAM_NOTIFICATION,
      NotificationTypeEnum.sendFriendInviteNotifications =>
        _SupabaseFunctionsConstants.SEND_FRIEND_INVITE_NOTIFICATIONS,
      NotificationTypeEnum.sendMessageNotification =>
        _SupabaseFunctionsConstants.SEND_MESSAGE_NOTIFICATION,
      NotificationTypeEnum.sendJamFormSubmittedJoinedNotification =>
        _SupabaseFunctionsConstants.SEND_JAM_FORM_SUBMITTED_JOINED_NOTIFICATION,
      NotificationTypeEnum.sendJamRequestAcceptedNotification =>
        _SupabaseFunctionsConstants.SEND_JAM_REQUEST_ACCEPTED_NOTIFICATION,
    };
  }
}

enum PushNotificationType {
  friendInvite,
  jamInvite,
  joinFormSubmitted,
  joinFormSubmittedJoined,
  jamRequestAccepted,
  messageNotification;

  static PushNotificationType parse(String string) {
    return switch (string) {
      'friend_invite' => PushNotificationType.friendInvite,
      'message_notification' => PushNotificationType.messageNotification,
      'jam_invite' => PushNotificationType.jamInvite,
      'send_jam_form_submitted_joined_notification' =>
        PushNotificationType.joinFormSubmitted,
      'jam_form_submitted' => PushNotificationType.joinFormSubmitted,
      'send_jam_request_accepted_notification' =>
        PushNotificationType.jamRequestAccepted,
      _ => throw Exception('Unknown push notification type: $string'),
    };
  }
}
