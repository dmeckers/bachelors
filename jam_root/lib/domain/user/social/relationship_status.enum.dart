enum RelationshipStatus {
  friends,
  friendRequestSent,
  friendRequestReceived,
  notFriends;

  static RelationshipStatus fromString(String value) => switch (value) {
        'friends' => RelationshipStatus.friends,
        'friend_request_sent' => RelationshipStatus.friendRequestSent,
        'not_friends' => RelationshipStatus.notFriends,
        'friend_request_received' => RelationshipStatus.friendRequestReceived,
        _ => throw Exception('Invalid RelationshipStatus value: $value'),
      };
}
