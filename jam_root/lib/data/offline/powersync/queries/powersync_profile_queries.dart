final class PowerSyncProfileQueries {
  static const GET_USER_PROFILE = '''
        SELECT
          *
        FROM profiles
        WHERE profiles.id = ?
      ''';

  static const GET_USERNAME_BY_USER_ID =
      'SELECT username FROM profiles WHERE id = ?';
}
