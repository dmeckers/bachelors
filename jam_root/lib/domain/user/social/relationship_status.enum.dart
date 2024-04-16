enum RelationshipStatus {
  friends,
  friendRequestSent,
  notFriends;

  static RelationshipStatus fromString(String value) => switch (value) {
        'friends' => RelationshipStatus.friends,
        'friend_request_sent' => RelationshipStatus.friendRequestSent,
        'not_friends' => RelationshipStatus.notFriends,
        _ => throw Exception('Invalid RelationshipStatus value: $value'),
      };
}
