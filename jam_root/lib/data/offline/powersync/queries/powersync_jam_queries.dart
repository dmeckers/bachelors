final class PowerSyncJamQueries {
  static const DELETE_JAM = 'DELETE FROM jams WHERE id = ?';
  static const JOIN_JAM = """
    INSERT INTO jams_users
      (jam_id, user_id)
    VALUES
      (?, ?)
    """;

  static const CREATE_JAM = """
    INSERT INTO jams
      (
        id,
        location,
        name,
        description,
        location_name,
        date,
        max_participants,
        extra_information,
        invites_only,
        invites_per_member,
        inserted_at,
        background_url
      )
    VALUES
      (?,?,?,? ,?, ?, ?, ?, ?,? , ? , ?)
  """;

  static const UPDATE_JAM_DETAILS = """
    UPDATE jams
    SET
      location = ?,
      name = ?,
      description = ?,
      location_name = ?,
      date = ?,
      max_participants = ?,
      extra_information = ?,
      invites_only = ?,
      invites_per_member = ?,
      background_url = ?
    WHERE
      id = ?;
  """;

  static const GET_JAM_BACKGROUND_URL = """
    SELECT
      background_url
    FROM
      jams
    WHERE
      id = ?;
  """;

  static const INSERT_JAM_VIBES = """
    INSERT INTO jams_vibes
      (id, jam_id, vibe_id , inserted_at)
    VALUES
      (?, ?, ? , ?)
  """;

  static const GET_JAM_BY_ID = """
      SELECT
        jams.id,
        jams.name,
        jams.description,
        jams.location_name,
        jams.lat,
        jams.lon,
        jams.date,
        jams.max_participants,
        jams.extra_information,
        jams.invites_only,
        jams.invites_per_member,
        jams.icon_url,
        jams.background_url,
        jams.creator_id,
        jams.creator_id,
        profiles.full_name,
        profiles.avatar
      FROM jams
      JOIN profiles ON jams.creator_id = profiles.id
      WHERE jams.id = ?;
    """;

  static const GET_ACTIVE_OWNER_JAM_IDS = """
    SELECT
        jams.id
    FROM jams
    LEFT JOIN
        jams_users js
    ON jams.id = js.jam_id
    WHERE jams.creator_id = ?  AND jams.date > ?;
  """;

  static const GET_ACTIVE_PARTICPATED_JAMS_IDS_BY_USER_ID = """
      SELECT
        jams.id
      FROM jams
      LEFT JOIN
        jams_users js
      ON jams.id = js.jam_id
      WHERE js.user_id = ? AND jams.date > ?;
  """;

  static const GET_OUTDATED_JAM_IDS_BY_USER_ID = """
      SELECT
        jams.id
      FROM jams
      LEFT JOIN
        jams_users js
      ON jams.id = js.jam_id
      WHERE (jams.creator_id = ? OR js.user_id = ?) AND jams.date < DATE('now');
  """;

  static const GET_JAM_VIBES = """
      SELECT
        vibes.id,
        vibes.name,
      FROM jams_vibes
      LEFT JOIN vibes ON jams_vibes.vibe_id = vibes.id
      WHERE jams_vibes.jam_id = ?;
    """;

  static const GET_JAM_VIBES_BY_TIMESTAMP = """
      SELECT
        vibe_id
      FROM
        jams_vibes
      WHERE
        inserted_at = ?;
    """;

  static const GET_JAM_PARTICIPATNS = """
      SELECT * FROM profiles
      WHERE id IN (
        SELECT user_id FROM jams_users
        WHERE jam_id = ?
      );
    """;

  static const GET_JAM_NAMES_BY_IDS = """
      SELECT
        id,
        name
      FROM jams
      WHERE id IN (?);
    """;
}
