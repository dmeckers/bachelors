import 'package:jam/config/constants/supabase/supabase.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

class JamDeletedMapEvent implements MapEvent {
  const JamDeletedMapEvent({
    required this.jamId,
    required this.creatorId,
    required this.latitude,
    required this.longitude,
    required this.vibes,
    required this.name,
  });

  final int jamId;
  final String creatorId;
  final String name;

  @override
  final double latitude;

  @override
  final double longitude;

  @override
  String get eventName => RealTime.JAM_DELETED_MAP_EVENT;

  @override
  Map<String, dynamic>? get payload => {
        'jam_id': jamId,
        'creator_id': creatorId,
        'latitude': latitude,
        'longitude': longitude,
        'name': name,
        'vibes': vibes.map((vibe) => vibe.toJson()).toList(),
      };

  @override
  final List<VibeModel> vibes;

  factory JamDeletedMapEvent.fromModel(int jamId) {
    return JamDeletedMapEvent(
      jamId: jamId,
      creatorId: '',
      latitude: -1,
      longitude: -1,
      vibes: [],
      name: '',
    );
  }
}
