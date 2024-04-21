enum PushNotificationType {
  friendInvite,
  jamInvite,
  messageNotification;

  static PushNotificationType parse(String string) {
    return switch (string) {
      'friend_invite' => PushNotificationType.friendInvite,
      'message_notification' => PushNotificationType.messageNotification,
      'jam_invite' => PushNotificationType.jamInvite,
      _ => throw Exception('Unknown push notification type: $string'),
    };
  }
}
