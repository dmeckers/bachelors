final class PowerSyncVibesQueries {
  static const GET_USER_VIBES = '''
        SELECT
          *
        FROM vibes
        JOIN
          users_vibes
        ON
          vibes.id = users_vibes.vibe_id
        WHERE user_id = ?
      ''';
}
