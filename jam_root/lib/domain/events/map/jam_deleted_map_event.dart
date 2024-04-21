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
  String get eventName => MapRealTime.JAM_DELETED_MAP_EVENT;

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

  factory JamDeletedMapEvent.fromModel(JamModel jam) {
    final coords = jam.lat == -1
        ? jam.location.extractCords()
        : (lat: jam.lat, lon: jam.lon);

    return JamDeletedMapEvent(
      jamId: jam.id!,
      creatorId: jam.creatorId ?? '',
      latitude: coords.lat!,
      longitude: coords.lon!,
      vibes: jam.relatedVibes,
      name: jam.backfilled.name!,
    );
  }
}
