import 'package:flutter/foundation.dart';
import 'package:powersync/sqlite3.dart' as sqlite;

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

final class PowerSyncRowParser {
  static MessageModel parseMessage(sqlite.Row row) {
    try {
      return MessageModel.fromJson(Json.of(row).castToInt(key: 'id'));
    } catch (e) {
      debugPrint(row.toString());
      rethrow;
    }
  }

  static ChatModel parseChat(sqlite.Row row) {
    try {
      return ChatModel(
        id: int.parse(row['id']),
        relatedContact: PowerSyncRowParser.parseUserProfile(row),
        unreadMessagesCount: 0,
        lastMessage: PowerSyncRowParser.parseLastMessage(row),
        chatEventType: null,
        isPinned: row['is_pinned'] == 1,
        isArchived: row['is_archived'] == 1,
      );
    } catch (e) {
      debugPrint(row.toString());
      rethrow;
    }
  }

  static UserProfileModel parseUserProfile(sqlite.Row row,
      [String profilePrimaryKey = 'contact_id']) {
    try {
      return UserProfileModel.fromJson(
        Json.of(
          row,
        )
            .renameKey(
              oldKey: profilePrimaryKey,
              newKey: 'id',
            )
            .replaceKeyValue(
              key: 'is_online',
              value: row['is_online'] == 1,
            ),
      );
    } catch (e) {
      debugPrint(row.toString());
      rethrow;
    }
  }

  static LastMessageModel? parseLastMessage(sqlite.Row row,
      [String primaryKey = 'message_id']) {
    try {
      return row[primaryKey] != null
          ? LastMessageModel.fromJson(
              Json.of(row).renameKeyWithValue(
                oldKey: primaryKey,
                newKey: 'id',
                value: int.tryParse(row[primaryKey]),
              ),
            )
          : null;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static VibeModel parseVibes(sqlite.Row row) {
    try {
      return VibeModel.fromJson(
        Json.of(row).replaceKeyValue(
          key: 'id',
          value: int.parse(row['id']),
        ),
      );
    } catch (e) {
      debugPrint(row.toString());
      rethrow;
    }
  }

  //pizda
  static VibeModel parseVibesFromPivot(sqlite.Row row) {
    try {
      return VibeModel.fromJson(
        Json.of(row).replaceKeyValue(
          key: 'id',
          value: row['vibe_id'],
        ),
      );
    } catch (e) {
      debugPrint(row.toString());
      rethrow;
    }
  }

  static JamModel parseJam(sqlite.Row row) {
    final json = Json.of(row);
    final model = JamModel.fromJson(
      json
        ..putIfAbsent('relatedVibes', () => [])
        ..putIfAbsent('related_vibes', () => [])
        ..replaceKeyValue(
          key: 'id',
          value: int.parse(
            json['id'],
          ),
        )
        ..replaceKeyValue(
          key: 'invites_only',
          value: json['invites_only'] == 1,
        ),
    );

    return model.copyWith(
      creator: UserProfileModel(
        lastActiveAt: DateTime.parse(row['last_active_at']),
        id: row['creator_id'],
        avatar: row['avatar'],
        fullName: row['full_name'],
      ),
    );
  }

  static UserProfileModel parseJamParticipant(sqlite.Row row) {
    try {
      return UserProfileModel.fromJson(
        Json.of(row).replaceKeyValue(
          key: 'is_online',
          value: row['is_online'] == 1,
        ),
      );
    } catch (e) {
      debugPrint(row.toString());
      rethrow;
    }
  }
}
