import 'package:powersync/powersync.dart';
import 'package:powersync_attachments_helper/powersync_attachments_helper.dart';

Schema schema = Schema([
  const Table('messages', [
    Column.text('sender_id'),
    Column.integer('chat_id'),
    Column.text('own_message'),
    Column.text('edited_at'),
    Column.text('media_content'),
    Column.integer('replied_to'),
    Column.text('message_text'),
    Column.text('sent_at'),
    Column.text('message_type'),
    Column.text('pinned_state')
  ]),
  const Table('own_encrypted', [
    Column.text('created_at'),
    Column.text('user_id'),
    Column.integer('message_id'),
    Column.text('message_text'),
    Column.text('message_media')
  ]),
  const Table('message_status', [
    Column.integer('message_id'),
    Column.text('user_id'),
    Column.text('message_status'),
    Column.text('read_at'),
    Column.text('created_at')
  ]),
  const Table('profiles', [
    Column.text('username'),
    Column.text('full_name'),
    Column.text('profile_status'),
    Column.text('avatar'),
    Column.text('website'),
    Column.text('inserted_at'),
    Column.text('updated_at'),
    Column.text('fcm_token'),
    Column.text('last_sign_in_at'),
    Column.integer('is_online'),
    Column.text('public_key')
  ]),
  const Table('deleted_messages', [
    Column.text('created_at'),
    Column.integer('message_id'),
    Column.text('user_id')
  ]),
  const Table('users_chats', [
    Column.text('user_id'),
    Column.integer('chat_id'),
    Column.integer('to_hide'),
    Column.text('created_at'),
    Column.integer('is_archived'),
    Column.integer('is_pinned')
  ]),
  const Table('friend_invites', [
    Column.text('user_sent'),
    Column.text('user_received'),
    Column.text('status'),
    Column.text('inserted_at'),
    Column.text('updated_at')
  ]),
  const Table('jam_invites', [
    Column.text('invited_user_id'),
    Column.text('sended_from_user_id'),
    Column.integer('jam_id'),
    Column.text('status'),
    Column.text('inserted_at'),
    Column.text('updated_at')
  ]),
  const Table('users_vibes', [
    Column.text('user_id'),
    Column.integer('vibe_id'),
    Column.integer('is_favorite'),
    Column.text('inserted_at'),
    Column.text('updated_at')
  ]),
  const Table('chats', [Column.text('created_at'), Column.text('updated_at')]),
  const Table('vibes', [
    Column.text('name'),
    Column.text('embedding'),
    Column.text('inserted_at'),
    Column.text('updated_at'),
    Column.text('description'),
    Column.text('icon_url'),
    Column.text('aliases'),
    Column.text('search_vector')
  ]),
  const Table('about_me_visibility_user_whitelist',
      [Column.text('profile_settings_id'), Column.text('user_uuid')]),
  const Table('banned', [
    Column.text('banned_by'),
    Column.text('banned'),
    Column.text('inserted_at'),
    Column.text('updated_at')
  ]),
  const Table('display_last_seen_vsisibility_whitelist',
      [Column.text('profile_settings_id'), Column.text('user_uuid')]),
  const Table('friends', [
    Column.text('user_one_id'),
    Column.text('user_two_id'),
    Column.text('inserted_at'),
    Column.text('updated_at')
  ]),
  const Table('invite_to_communities_user_whitelist',
      [Column.text('profile_settings_id'), Column.text('user_uuid')]),
  const Table('invite_to_jams_user_whitelist',
      [Column.text('profile_settings_id'), Column.text('user_uuid')]),
  const Table('jams_users', [
    Column.text('user_id'),
    Column.integer('jam_id'),
    Column.integer('invites_used'),
    Column.integer('is_admin'),
    Column.text('inserted_at'),
    Column.text('updated_at')
  ]),
  const Table('jams_vibes', [
    Column.integer('jam_id'),
    Column.integer('vibe_id'),
    Column.text('inserted_at'),
    Column.text('updated_at')
  ]),
  const Table('map_visibility_user_whitelist',
      [Column.text('profile_settings_id'), Column.text('user_uuid')]),
  const Table('phone_visibility_user_whitelist',
      [Column.text('profile_settings_id'), Column.text('user_uuid')]),
  const Table('profile_settings',
      [Column.text('updated_at'), Column.integer('two_step_auth_enabled')]),
  const Table('security_profile_settings', [
    Column.text('can_be_found_by_phone'),
    Column.text('can_be_invited_to_communities'),
    Column.text('can_be_invited_to_jams'),
    Column.text('map_visibility'),
    Column.text('about_me_visibility'),
    Column.text('phone_visibility'),
    Column.text('display_last_seen_visibility')
  ]),
  const Table('jams', [
    Column.text('creator_id'),
    Column.text('name'),
    Column.text('description'),
    Column.text('location_name'),
    Column.text('location'),
    Column.text('date'),
    Column.integer('invites_only'),
    Column.text('extra_information'),
    Column.integer('max_participants'),
    Column.integer('invites_per_member'),
    Column.text('icon_url'),
    Column.text('inserted_at'),
    Column.text('updated_at'),
    Column.real('lat'),
    Column.real('lon'),
    Column.text('background_url'),
  ]),
  const Table(
    'user_locations',
    [
      Column.text('location'),
      Column.text('created_at'),
    ],
  ),
  const Table(
    'vibe_pivot',
    [
      Column.integer('parent_vibe_id'),
      Column.integer('child_vibe_id'),
    ],
  ),
  AttachmentsQueueTable(
    attachmentsQueueTableName: 'jam_media_queue',
    additionalColumns: [
      const Column.text('jam_id'),
      const Column.text('content_type'),
    ],
  )
]);
