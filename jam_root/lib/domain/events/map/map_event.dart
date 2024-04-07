import 'package:jam/domain/domain.dart';

class MapEvent extends Event {
  final double latitude;
  final double longitude;
  final List<VibeModel> vibes;

  MapEvent({
    required this.latitude,
    required this.longitude,
    this.payload,
    required this.vibes,
  });

  @override
  String get eventName => 'MAP_EVENT';

  @override
  final Map<String, dynamic>? payload;
}
