import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

class NewJamCreatedEvent implements MapEvent {
  const NewJamCreatedEvent({
    required this.jamId,
    required this.creatorId,
    required this.latitude,
    required this.longitude,
    required this.vibes,
    required this.date,
    this.jamName,
    this.description,
    this.locationName,
  });
  final int jamId;
  final String? description;
  final String? locationName;
  final String date;
  final String? jamName;

  @override
  String get eventName => RealTime.JAM_CREATED_MAP_EVENT;

  @override
  Map<String, dynamic>? get payload => {
        'jam_id': jamId,
        'creator_id': creatorId,
        'latitude': latitude,
        'longitude': longitude,
        'date': date,
        'name': jamName ?? 'No name',
        'description': description ?? 'No description',
        'location_name': locationName ?? 'No location name',
        'vibes': vibes.map((vibe) => vibe.toJson()).toList(),
      };

  @override
  final double latitude;

  @override
  final double longitude;

  @override
  final List<VibeModel> vibes;

  final String creatorId;

  factory NewJamCreatedEvent.fromModel(JamModel jamModel) {
    final coords = jamModel.location.extractCords();
    return NewJamCreatedEvent(
      jamId: jamModel.id!,
      jamName: jamModel.name,
      creatorId: jamModel.creatorId!,
      latitude: coords.lat,
      longitude: coords.lon,
      vibes: jamModel.relatedVibes,
      date: jamModel.date.toIso8601String(),
      description: jamModel.description ?? 'No description',
      locationName: jamModel.locationName ?? 'No location name',
    );
  }
}
