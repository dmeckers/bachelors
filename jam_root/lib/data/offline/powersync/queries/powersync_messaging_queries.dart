final class PowerSyncMessagingQueries {
  static QUERY_GET_MESSAGES({
    required String userId,
    required int chatId,
    int offset = 0,
    int limit = 30,
    int perPage = 50,
  }) =>
      """
      SELECT
        m.id,
        m.sender_id,
        sp.username,
        sp.public_key,
        m.chat_id,
        m.pinned_state,
          CASE
            WHEN m.sender_id = '$userId'  AND m.message_type != 'event' THEN
                own_m.message_media
            ELSE
                m.media_content
            END
          as media_content,
            CASE
              WHEN m.sender_id = '$userId' AND m.message_type != 'event' THEN
                  own_m.message_text
              ELSE
                  m.message_text
            END as message_text,
        m.message_type,
        m.edited_at,
        m.sent_at,
        m.replied_to,
        ms.message_status
      FROM messages m
      JOIN
        profiles sp
      ON
        m.sender_id = sp.id
      LEFT JOIN
        own_encrypted own_m
      ON
        own_m.user_id = m.sender_id and own_m.message_id = m.id
      LEFT JOIN
        deleted_messages dm
      ON
        m.id = dm.message_id
      LEFT JOIN
        message_status ms
      ON
        m.id = ms.message_id
      WHERE
        dm.message_id IS NULL and m.chat_id = $chatId
      ORDER BY
        m.sent_at DESC
      LIMIT $limit
      OFFSET $offset * $perPage
  """;

  static QUERY_GET_CHATS({required String userId}) => """
  SELECT
    c.id,
    p.id as contact_id,
    p.username,
    p.full_name,
    p.profile_status,
    p.avatar,
    p.fcm_token,
    p.last_sign_in_at,
    p.is_online,
    p.public_key,
    uc.is_pinned,
    uc.is_archived,
    uc.user_id as chat_user_id,
    uc.id as user_chat_id,
    last_message.id as message_id,
    last_message.sender_id,
    last_message.message_text,
    last_message.sent_at,
    last_message.replied_to,
    last_message.chat_id,
    last_message.message_type,
    last_message.edited_at,
    last_message.media_content,
    last_message.pinned_state,
    last_message.message_status
  FROM
    users_chats uc
  JOIN
    chats c ON uc.chat_id = c.id
  JOIN
    users_chats uc2 ON uc2.chat_id = c.id AND uc2.user_id != '$userId'
  LEFT JOIN
    profiles p ON p.id = uc2.user_id
  LEFT JOIN
  (
    SELECT *,
      ROW_NUMBER() OVER (PARTITION BY chat_id ORDER BY sent_at DESC) as rn
    FROM
      (
        SELECT
          m.id,
          m.sender_id,
          CASE
            WHEN m.message_type = 'text' AND own_m.message_text IS NOT NULL AND m.sender_id = '$userId' THEN own_m.message_text
            ELSE m.message_text
          END as message_text,
          m.sent_at,
          m.replied_to,
          m.chat_id,
          m.message_type,
          m.edited_at,
          m.pinned_state,
          ms.message_status,
          CASE
            WHEN m.message_type != 'text' AND own_m.message_media IS NOT NULL AND m.sender_id = '$userId' THEN own_m.message_media
            ELSE m.media_content
          END as media_content
        FROM
          messages m
        LEFT JOIN
          own_encrypted own_m ON own_m.message_id = m.id AND own_m.user_id = m.sender_id
        LEFT JOIN
          message_status ms
        ON
          m.id = ms.message_id
        WHERE
          NOT EXISTS (
            SELECT 1
            FROM deleted_messages dm
            WHERE dm.message_id = m.id
          )
      ) AS all_messages
  ) AS last_message ON last_message.chat_id = c.id AND last_message.rn = 1
  WHERE
    uc.user_id = '$userId';
  """;

  static QUERY_GET_PINNED_MESSAGES({
    required String userId,
    required int chatId,
    int offset = 0,
    int limit = 30,
    int perPage = 50,
  }) =>
      """
      SELECT
        m.id,
        m.sender_id,
        m.message_text,
        sp.username,
        sp.public_key,
        m.chat_id,
        m.pinned_state,
          CASE
            WHEN m.sender_id = '$userId'  AND m.message_type != 'event' THEN
                own_m.message_media
            ELSE
                m.media_content
            END
          as media_content,
            CASE
              WHEN m.sender_id = '$userId' AND m.message_type != 'event' THEN
                  own_m.message_text
              ELSE
                  m.message_text
            END as message_text,
        m.message_type,
        m.edited_at,
        m.sent_at,
        m.replied_to
      FROM messages m
      JOIN
        profiles sp
      ON
        m.sender_id = sp.id
      LEFT JOIN
        own_encrypted own_m
      ON
        own_m.user_id = m.sender_id and own_m.message_id = m.id
      LEFT JOIN
        deleted_messages dm
      ON
        m.id = dm.message_id
      LEFT JOIN
        message_status ms
      ON
        m.id = ms.message_id
      WHERE
        dm.message_id IS NULL and m.chat_id = $chatId AND m.pinned_state != 'no_one'
      ORDER BY
        m.sent_at DESC
      LIMIT $limit
      OFFSET $offset * $perPage
  """;
}
