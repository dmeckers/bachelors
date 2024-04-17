import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

class UserChangedMapVisibilityMapEvent implements MapEvent {
  const UserChangedMapVisibilityMapEvent({
    required this.userId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.vibes,
    required this.privacyBoundaries,
    this.friendIds,
    this.exceptionUserList,
  }) : assert((privacyBoundaries == PrivacyBoundaries.friendsOnly
                ? friendIds != null
                : true) &&
            (privacyBoundaries == PrivacyBoundaries.rangeOfUsers
                ? exceptionUserList != null
                : true));

  final String userId;
  final String name;
  final PrivacyBoundaries privacyBoundaries;
  final Strings? friendIds;
  final Strings? exceptionUserList;

  @override
  final double latitude;

  @override
  final double longitude;

  @override
  final List<VibeModel> vibes;

  @override
  String get eventName => MapRealTime.USER_CHANGED_MAP_VISIBILITY_MAP_EVENT;

  @override
  Map<String, dynamic>? get payload => {
        'user_id': userId,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'vibes': vibes.map((e) => e.id).toList(),
        'privacy_boundaries': privacyBoundaries.index,
        'friend_ids': friendIds ?? [],
        'exception_user_list': exceptionUserList ?? [],
        //TODO
        'is_friend': false,
      };
}
