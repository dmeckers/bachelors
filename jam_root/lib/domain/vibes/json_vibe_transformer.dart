import 'package:jam/domain/domain.dart';

final class JsonVibeTransformer {
  static List<int> vibesToIds(List<VibeModel> vibes) {
    return vibes.map((e) => e.id).toList();
  }
}
