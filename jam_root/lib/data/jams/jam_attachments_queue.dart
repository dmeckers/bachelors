import 'dart:async';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:powersync_attachments_helper/powersync_attachments_helper.dart';

/// Function to handle errors when downloading attachments
/// Return false if you want to archive the attachment
Future<bool> onDownloadError(Attachment attachment, Object exception) async {
  if (exception.toString().contains('Object not found')) {
    return false;
  }
  return true;
}

late final JamAttachmentQueue jamAttachmentQueue;
late final SupabaseStorageAdapter jamStorageAdapter;

class JamAttachement extends Attachment {
  final String jamId;
  final String? contentType;
  JamAttachement({
    required super.id,
    required super.filename,
    required super.state,
    required super.localUri,
    required super.mediaType,
    required super.size,
    required this.jamId,
    this.contentType,
  });
}

class JamAttachmentQueue extends AbstractAttachmentQueue {
  JamAttachmentQueue(db, remoteStorage)
      : super(
          db: db,
          remoteStorage: remoteStorage,
          onDownloadError: onDownloadError,
          attachmentsQueueTableName: 'jam_media_queue',
        );

  @override
  init() async {
    if (Storage.SHARED_BUCKET_URL.isEmpty) {
      return log.info(
        'No Supabase bucket configured, skip setting up JamAttachmentQueue watches',
      );
    }

    return super.init();
  }

  @override
  Future<Attachment> deletePhoto(String photoId) {
    Attachment photoAttachment = Attachment(
      id: photoId,
      filename: photoId,
      state: AttachmentState.queuedDelete.index,
    );

    return attachmentsService.saveAttachment(photoAttachment);
  }

  @override
  Future<Attachment> savePhoto(String photoId, int size) {
    JamAttachement photoAttachment = JamAttachement(
      jamId: photoId.split('.').first,
      contentType: 'background',
      id: photoId,
      filename: photoId,
      state: AttachmentState.queuedUpload.index,
      mediaType: 'image/${photoId.split('.').last}',
      localUri: getLocalFilePathSuffix(photoId),
      size: size,
    );

    return attachmentsService.saveAttachment(photoAttachment);
  }

  @override
  StreamSubscription<void> watchIds({String fileExtension = 'jpg'}) {
    return PowerSync.db
        .watch("""
          SELECT jam_id from jam_media_queue
          WHERE jam_id IS NOT NULL
        """)
        .map((rows) => rows.map((row) => row['jam_id'] as String).toList())
        .listen(
          (ids) async {
            Strings idsInQueue = await attachmentsService.getAttachmentIds();
            for (String id in ids) {
              await syncingService.reconcileId(id, idsInQueue, fileExtension);
            }
          },
        );
  }
}

Future initializeJamAttachementQueue() async {
  jamStorageAdapter = SupabaseStorageAdapter(
    bucket: SupabaseBucketConfig.jamBackgrounds,
  );
  jamAttachmentQueue = JamAttachmentQueue(
    PowerSync.db,
    jamStorageAdapter,
  );

  await jamAttachmentQueue.init();
}
