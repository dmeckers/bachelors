import 'package:jam/config/constants/supabase/supabase.dart';
import 'package:jam/domain/domain.dart';

class UserVibesChangedMapEvent implements MapEvent {
  const UserVibesChangedMapEvent({
    required this.userId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.vibes,
  });

  final String userId;
  final String name;

  @override
  final double latitude;

  @override
  final double longitude;

  @override
  final List<VibeModel> vibes;

  @override
  String get eventName => MapRealTime.USER_UPDATED_VIBES_MAP_EVENT;

  @override
  Map<String, dynamic>? get payload => {
        'user_id': userId,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'vibes': vibes.map((e) => e.id).toList(),
        //TODO
        'is_friend': false,
      };
}
