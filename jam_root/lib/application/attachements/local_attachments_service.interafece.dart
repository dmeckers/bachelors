import 'dart:io';

import 'package:jam/application/application.dart';

abstract class LocalAttachmentServiceInterface<T extends Identifiable> {
  Future<String> uploadLocalFile({
    required File file,
    required T identifiable,
    required LocalAttachmentEntities entity,
  });
  Future<void> deleteLocalFile({
    required LocalAttachmentEntities entity,
    required Identifiable identifiable,
  });
  // String getLocalFileLink({required String path});

  Future<File?> getCachedFile({
    required LocalAttachmentEntities entity,
    required Identifiable identifiable,
  });

  Future<bool> isCached({
    required LocalAttachmentEntities entity,
    required Identifiable identifiable,
  });
}
