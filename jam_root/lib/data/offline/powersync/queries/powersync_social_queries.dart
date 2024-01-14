final class PowerSyncSocialQueries {
  static const CHECK_FRIEND_INVITE_SENT_SQL = '''
        SELECT EXISTS(
          SELECT 1
          FROM friend_invites
          WHERE user_sent = ? AND user_received = ?
        )
      ''';

  static const GET_FRIEND_INVITES = """
        SELECT
          fi.id,
          fi.inserted_at as sent_at,
          fi.status,
          fi.user_sent as user_id,
          p.username,
          p.avatar
        FROM friend_invites fi
        JOIN profiles p ON fi.user_sent = p.id
        WHERE fi.user_received = ?
      """;

  static GET_FRIENDS(String userId) => """
    SELECT DISTINCT
        CASE
            WHEN f.user_one_id = '$userId' THEN f.user_two_id
            ELSE f.user_one_id
        END AS id,
        p.username,
        p.full_name,
        p.avatar,
        p.profile_status,
        p.last_sign_in_at,
        p.public_key,
        (
            SELECT uc.chat_id
            FROM
                users_chats uc
            WHERE
                (uc.user_id = f.user_one_id OR uc.user_id = f.user_two_id)
            AND
                uc.user_id <> '$userId'
            LIMIT 1
        ) AS chat_id
    FROM
        friends f
    JOIN
        profiles p
        ON p.id = CASE
                    WHEN f.user_one_id = '$userId' THEN f.user_two_id
                    ELSE f.user_one_id
                  END
    WHERE
        f.user_one_id = '$userId' OR f.user_two_id = '$userId';
""";

  static const GET_JAM_INVITES = """
    SELECT
      ji.id,
      ji.jam_id,
      ji.invited_user_id,
      ji.sended_from_user_id,
      ji.status,
      ji.inserted_at
    FROM jam_invites ji
    WHERE
        ji.invited_user_id = ?
      AND
        ji.status = 'pending';
  """;

  static const GET_SENT_JAM_INVITES = """
    SELECT
      ji.id,
      ji.jam_id,
      ji.invited_user_id,
      ji.sended_from_user_id,
      ji.status,
      ji.inserted_at
    FROM jam_invites ji
    WHERE
        ji.sended_from_user_id = ?
      AND
        ji.status = 'pending';
  """;
}
