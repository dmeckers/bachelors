import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

part 'chat_background.g.dart';

@riverpod
class ChatBackground extends _$ChatBackground {
  @override
  FutureOr<File?> build(ChatModel chat) async {
    return await ref.read(localAttachmentsServiceProvider).getCachedFile(
          entity: LocalAttachmentEntities.chatBackgrounds,
          identifiable: chat,
        );
  }

  upsertImage(File file) async {
    final localAttachments = ref.read(localAttachmentsServiceProvider);
    final exists = await localAttachments.isCached(
      entity: LocalAttachmentEntities.chatBackgrounds,
      identifiable: chat,
    );

    if (exists) {
      await localAttachments.deleteLocalFile(
        entity: LocalAttachmentEntities.chatBackgrounds,
        identifiable: chat,
      );
    }

    await localAttachments.uploadLocalFile(
      file: file,
      identifiable: chat,
      entity: LocalAttachmentEntities.chatBackgrounds,
    );

    state = AsyncData(file);
  }

  deleteImage() async {
    final localAttachments = ref.read(localAttachmentsServiceProvider);
    final exists = await localAttachments.isCached(
      entity: LocalAttachmentEntities.chatBackgrounds,
      identifiable: chat,
    );

    if (exists) {
      await localAttachments.deleteLocalFile(
        entity: LocalAttachmentEntities.chatBackgrounds,
        identifiable: chat,
      );
    }

    state = const AsyncData(null);
  }
}
