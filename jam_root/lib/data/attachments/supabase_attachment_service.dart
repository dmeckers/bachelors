import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class SupabaseAttachmentService
    with SupabaseUserGetter
    implements AttachmentServiceInterface {
  const SupabaseAttachmentService({required this.bucket});

  @override
  final BucketInterface bucket;

  @override
  Future<void> delete(String filename, [Identifiable? model]) async {
    final directory = bucket.getFullPath(getUserIdOrThrow(), model);
    final fullPath =
        "$directory${filename.startsWith('/') ? filename.substring(1) : filename}";
    await supaBucket.remove([fullPath]);
  }

  @override
  Future<String> upload({required File file, Identifiable? model}) async {
    final directory = bucket.getFullPath(getUserIdOrThrow(), model);
    final filename = "${const Uuid().v4()}${path.extension(file.path)}";

    await supaBucket.upload("$directory/$filename", file);

    return filename;
  }

  @override
  Future<List<FileObject>> list({String? userId, Identifiable? model}) async {
    final directory = bucket.getFullPath(userId ?? getUserIdOrThrow(), model);

    return await supaBucket.list(
      path: directory,
      searchOptions: const SearchOptions(
        sortBy: SortBy(column: 'created_at', order: 'desc'),
      ),
    );
  }

  @override
  String getLink({
    required String filename,
    String? userId,
    Identifiable? model,
  }) {
    return supaBucket.getPublicUrl(
      bucket.getFullPath(userId ?? getUserIdOrThrow(), model),
    );
  }
}

final attachmentServiceProvider =
    Provider.family<AttachmentServiceInterface, BucketInterface>(
  (ref, bucket) => SupabaseAttachmentService(bucket: bucket),
);
