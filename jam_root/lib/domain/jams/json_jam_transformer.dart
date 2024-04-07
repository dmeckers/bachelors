import 'package:jam/domain/domain.dart';

final class JsonJamTransformer {
  static String locationToJson(String location) {
    RegExp regex = RegExp(r'-?\d+(\.\d+)?');
    Iterable<Match> matches = regex.allMatches(location);

    if (matches.length != 2) {
      throw Exception('Invalid location format');
    }

    List<String> digits = matches.map((match) => match.group(0)!).toList();

    return 'POINT(${digits[0]} ${digits[1]})';
  }

  static List<VibeModel> listStub(List<VibeModel>? value) {
    return value ?? ([] as List<VibeModel>);
  }

  static String locationFromJson(dynamic data) =>
      "Lat: ${data['lat']} , Lng: ${data['lon']}";

  static Object? readItself(json, key) => json;
}
