import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class LocalAttachmentService implements LocalAttachmentServiceInterface {
  @override
  Future<void> deleteLocalFile({
    required LocalAttachmentEntities entity,
    required Identifiable identifiable,
  }) async {
    await DefaultCacheManager().removeFile('${entity.name}_${identifiable.id}');
    //remove from documents directory
    final directory = await getApplicationDocumentsDirectory();
    final cacheKey = '${entity.name}_${identifiable.id}';
    final path = '${directory.path}/$cacheKey';
    final localFile = File(path);
    if (await localFile.exists()) {
      await localFile.delete();
    }
  }

  @override
  Future<File?> getCachedFile({
    required LocalAttachmentEntities entity,
    required Identifiable identifiable,
  }) async =>
      await DefaultCacheManager().getSingleFile(
        '${entity.name}_${identifiable.id}',
      );

  @override
  Future<String> uploadLocalFile({
    required File file,
    required Identifiable identifiable,
    required LocalAttachmentEntities entity,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final cacheKey = '${entity.name}_${identifiable.id}';
    final path = '${directory.path}/$cacheKey';
    final localFile = await file.copy(path);

    await DefaultCacheManager().putFile(
      cacheKey,
      await localFile.readAsBytes(),
    );

    return localFile.path;
  }

  @override
  Future<bool> isCached({
    required LocalAttachmentEntities entity,
    required Identifiable identifiable,
  }) =>
      DefaultCacheManager()
          .getFileFromCache('${entity.name}_${identifiable.id}')
          .then((value) => value != null);
}

final localAttachmentsServiceProvider =
    Provider<LocalAttachmentServiceInterface>(
  (ref) => LocalAttachmentService(),
);
