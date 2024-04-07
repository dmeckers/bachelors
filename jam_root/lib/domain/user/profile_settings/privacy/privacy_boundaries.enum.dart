import 'package:hive_flutter/hive_flutter.dart';

part 'privacy_boundaries.enum.g.dart';

@HiveType(typeId: 26)
enum PrivacyBoundaries {
  @HiveField(0)
  everyone('Everyone'),
  @HiveField(1)
  friendsOnly('Friends only'),
  @HiveField(2)
  noOne('No one'),
  @HiveField(3)
  rangeOfUsers('Range of users');

  final String displayName;

  const PrivacyBoundaries(this.displayName);

  static PrivacyBoundaries fromIndex(int index) {
    switch (index) {
      case 0:
        return PrivacyBoundaries.everyone;
      case 1:
        return PrivacyBoundaries.friendsOnly;
      case 2:
        return PrivacyBoundaries.noOne;
      case 3:
        return PrivacyBoundaries.rangeOfUsers;
      default:
        throw Exception('Invalid index');
    }
  }
}
