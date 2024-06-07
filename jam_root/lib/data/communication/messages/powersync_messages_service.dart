import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';

class PowerSyncMessagesService with SupabaseUserGetter {
  Stream<Messages> messages$(int chatId) async* {
    yield* PowerSync.db
        .watch(
          PowerSyncMessagingQueries.QUERY_GET_MESSAGES(
            userId: getUserIdOrThrow(),
            chatId: chatId,
            offset: 0,
            limit: 100,
            perPage: 100,
          ),
        )
        .map(
          (event) => event.where((element) => element['message_text'] != null),
        )
        .map(
          (rows) =>
              rows.map((row) => PowerSyncRowParser.parseMessage(row)).toList(),
        );
  }

  Future<Messages> loadMessages({
    required int chatId,
    int offset = 0,
    int limit = 20,
  }) async {
    final rows = await PowerSync.db.getAll(
      PowerSyncMessagingQueries.QUERY_GET_MESSAGES(
        userId: getUserIdOrThrow(),
        chatId: chatId,
        offset: offset,
        limit: limit,
      ),
    );

    return rows.map((row) => PowerSyncRowParser.parseMessage(row)).toList();
  }

  //TODO test
  Future<Messages> getPinnedMessages({
    required ChatModel chat,
    int offset = 0,
  }) async {
    final rows = await PowerSync.db.getAll(
      PowerSyncMessagingQueries.QUERY_GET_PINNED_MESSAGES(
        userId: getUserIdOrThrow(),
        chatId: chat.id,
        offset: offset,
      ),
    );

    return rows.map((row) => PowerSyncRowParser.parseMessage(row)).toList();
  }
}

final powerSyncMessageServiceProvider = Provider<PowerSyncMessagesService>(
  (ref) => PowerSyncMessagesService(),
);
