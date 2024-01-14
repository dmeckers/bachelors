import 'package:uuid/uuid.dart';

class PowerSyncPrivacyQueries {
  static String clearWhiteList({
    required String table,
    required String userId,
  }) =>
      "DELETE FROM $table WHERE profile_settings_id = '$userId'";

  static String insertIntoWhiteList({
    required String table,
    required String userId,
  }) {
    return "INSERT INTO $table (id ,profile_settings_id, user_uuid) VALUES ('${const Uuid().v4()}', '$userId', ?)";
  }

  static String updateVisiblity({
    required String column,
  }) =>
      "UPDATE security_profile_settings SET $column = ? WHERE id = ?";

  static String removeFromWhiteList({
    required String table,
  }) =>
      "DELETE FROM $table WHERE profile_settings_id = ? AND user_uuid = ?";

  static const GET_PRIVACY_SETTINGS = """
    SELECT
      s.id,
      s.display_last_seen_visibility,
      s.can_be_found_by_phone,
      s.can_be_invited_to_communities,
      s.can_be_invited_to_jams,
      s.map_visibility,
      s.about_me_visibility,
      s.phone_visibility
    FROM security_profile_settings s
    WHERE s.id = ?
  """;

  static const GET_MAP_VIBISILITY_WHITELIST = """
        SELECT
          m.id,
          p.id as user_id,
          p.full_name,
          p.username,
          p.avatar
        FROM
          map_visibility_user_whitelist m
        LEFT JOIN
          profiles p
        ON
          p.id = m.user_uuid
        WHERE
          m.profile_settings_id = ?;
  """;
}
