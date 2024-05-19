import 'package:powersync/powersync.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam_utils/jam_utils.dart';

typedef PowerSyncEventHandler = Future Function(
    PostgrestClient rest, CrudEntry entry);

Future _sendMessageRpc(PostgrestClient rest, CrudEntry entry) {
  final data = Json.of(entry.opData!);

  return rest.rpc(
    'send_default_text_message',
    params: {
      'chat_id': data['chat_id'],
      'message_text': data['message_text'],
      'own_message': data['own_message'],
      'replied_to': data['replied_to'],
    },
  );
}

Future _postJamRpc(PostgrestClient rest, CrudEntry entry) async {
  final data = Json.of(entry.opData!);

  final vibeRows = await PowerSync.db.getAll(
    PowerSyncJamQueries.GET_JAM_VIBES_BY_TIMESTAMP,
    [
      data['inserted_at'],
    ],
  );

  await rest.rpc(
    'post_jam',
    params: {
      'name': data['name'],
      'description': data['description'],
      'location': data['location'],
      'location_name': data['location_name'],
      'date': data['date'],
      'max_participants': data['max_participants'],
      'extra_information': data['extra_information'],
      'invites_only': data['invites_only'],
      'invites_per_member': data['invites_per_member'],
      'icon_url': (data['icon_url'] as String?).nullIfEmpty,
      'related_vibes': vibeRows.map((e) => e['vibe_id']).toList(),
      'background_url': data['background_url'],
    },
  );
}

Future _defaultInsertHandler(PostgrestClient rest, CrudEntry entry) {
  final data = Json.of(entry.opData!);

  return rest.from(entry.table).upsert(data..remove('id'));
}

Future _defaultUpdateHandler(PostgrestClient rest, CrudEntry entry) {
  final data = Json.of(entry.opData!);

  return rest.from(entry.table).update(data).eq('id', entry.id);
}

Future _updateJamHandler(PostgrestClient rest, CrudEntry entry) async {
  final data = Json.of(entry.opData!);
  final vibes = await supabase
      .from('jams_vibes')
      .select('vibe_id')
      .eq('jam_id', entry.id)
      .withConverter(
        (data) => data.map((e) => e['vibe_id']).toList(),
      );

  await rest.rpc(
    'update_jam',
    params: {
      'id': entry.id,
      'name': data['name'],
      'description': data['description'],
      'location': data['location'],
      'location_name': data['location_name'],
      'date': data['date'],
      'max_participants': data['max_participants'],
      'extra_information': data['extra_information'],
      'invites_only': data['invites_only'],
      'invites_per_member': data['invites_per_member'],
      'icon_url': (data['icon_url'] as String?).nullIfEmpty,
      'related_vibes': vibes,
      'background_url': data['background_url']
    },
  );
}

class PowerSyncDispatcherResolver {
  static PowerSyncEventHandler resolveInsert(CrudEntry data) {
    final isInsertMessage =
        data.table == 'messages' && data.opData?['message_type'] == 'text';

    final skipInsertJamVibes =
        data.table == 'jams_vibes' && data.opData?['jam_id'] == 0;

    if (skipInsertJamVibes) return (rest, entry) async {};

    if (isInsertMessage) return _sendMessageRpc;

    if (data.table == 'jams') return _postJamRpc;

    return _defaultInsertHandler;
  }

  static PowerSyncEventHandler resolveUpdate(CrudEntry data) {
    return switch (data.table) {
      'jams' => _updateJamHandler,
      _ => _defaultUpdateHandler
    };
  }
}
