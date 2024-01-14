import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';

class PowerSyncChatsService with SupabaseUserGetter {
  Stream<Chats> chats$() async* {
    try {
      yield* PowerSync.db
          .watch(
            PowerSyncMessagingQueries.QUERY_GET_CHATS(
              userId: getUserIdOrThrow(),
            ),
          )
          .map(
            (rows) =>
                rows.map((row) => PowerSyncRowParser.parseChat(row)).toList(),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

final powersyncChatsService = Provider((ref) => PowerSyncChatsService());
