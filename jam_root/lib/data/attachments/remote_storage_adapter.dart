import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:powersync_attachments_helper/powersync_attachments_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image/image.dart' as img;

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';

class SupabaseStorageAdapter
    with SupabaseUserGetter
    implements AbstractRemoteStorageAdapter {
  final SupabaseBucketConfig bucket;

  SupabaseStorageAdapter({required this.bucket});

  @override
  Future<void> uploadFile(
    String filename,
    File file, {
    String mediaType = 'text/plain',
  }) async {
    await supaBucket.upload(
      _getUploadPath(filename),
      file,
      fileOptions: FileOptions(contentType: mediaType),
    );
  }

  @override
  Future<Uint8List> downloadFile(String filePath) async {
    Uint8List fileBlob = await Supabase.instance.client.storage
        .from(bucket.config.path)
        .download(filePath);
    final image = img.decodeImage(fileBlob);
    Uint8List blob = img.JpegEncoder().encode(image!);
    return blob;
  }

  @override
  Future<void> deleteFile(String filename) async {
    await supaBucket.remove([_getUploadPath(filename).substring(1)]);
  }

  String _getUploadPath(String filename) {
    final userId = supabase.auth.currentUser!.id;

    return bucket.config.isOfUserDomain
        ? '${bucket.config.path}/$filename'
        : '${bucket.config.path.replaceFirst(bucket.config.path, userId)}/$filename';
  }
}

final remoteStorageAdapterProvider =
    Provider.family<AbstractRemoteStorageAdapter, SupabaseBucketConfig>(
  (ref, bucket) => SupabaseStorageAdapter(bucket: bucket),
);
