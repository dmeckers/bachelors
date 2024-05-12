import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

class JamQueue with SupabaseUserGetter implements JamQueueInterface {
  @override
  Future<JamModel> queueCreate(JamModel jam) async {
    final jamId = const Uuid().v4();
    final timestamp = DateTime.now().toString();

    await PowerSync.db.executeBatch(
      PowerSyncJamQueries.INSERT_JAM_VIBES,
      [
        ...jam.relatedVibes.map(
          (e) => [
            const Uuid().v4(),
            jamId,
            e.id,
            timestamp,
          ],
        )
      ],
    );

    final imageId = jam.image.isNull
        ? null
        : "${const Uuid().v4()}${path.extension(jam.image!.path)}";

    await PowerSync.db.execute(PowerSyncJamQueries.CREATE_JAM, [
      jamId,
      JsonJamTransformer.locationToJson(jam.location),
      jam.name,
      jam.description,
      jam.locationName,
      jam.date.toString(),
      jam.maxParticipants,
      jam.extraInformation,
      // jam.invitesOnly,
      jam.invitesPerMember,
      timestamp,
      imageId,
    ]);

    if (jam.image.isNull) return jam;

    await _queueAttachemntUpload(jam, imageId!);

    return jam;
  }

  @override
  Future<void> queueDelete({required int jamId}) {
    return PowerSync.db.execute(PowerSyncJamQueries.DELETE_JAM, [jamId]);
  }

  @override
  Future<bool> queueJoin({required int jamId}) async {
    try {
      await PowerSync.db.execute(PowerSyncJamQueries.JOIN_JAM, [jamId]);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<JamModel> queueUpdateDetails(JamModel jam) async {
    final row = await PowerSync.db.get(
      PowerSyncJamQueries.GET_JAM_BACKGROUND_URL,
      [jam.id],
    );

    final hadBackground = row['background_url'] != null;
    final isImageUploaded = jam.image?.path.trim().isNotEmptyOrNull ?? false;

    final mustDeleteImage = hadBackground && !isImageUploaded;
    final hasToKeepOldImage = jam.backgroundUrl.isNotEmptyOrNull;

    final imageUrl = hasToKeepOldImage
        ? jam.backgroundUrl
        : mustDeleteImage
            ? null
            : isImageUploaded
                ? "${const Uuid().v4()}${path.extension(jam.image!.path)}"
                : null;

    await PowerSync.db.execute(PowerSyncJamQueries.UPDATE_JAM_DETAILS, [
      JsonJamTransformer.locationToJson(jam.location),
      jam.name,
      jam.description,
      jam.locationName,
      jam.date.toString(),
      jam.maxParticipants,
      jam.extraInformation,
      // jam.invitesOnly,
      jam.invitesPerMember,
      imageUrl,
      jam.id,
    ]);

    // if model returned with url it means that image was not changed
    if (jam.backgroundUrl.isNotEmptyOrNull) return jam;

    if (mustDeleteImage) {
      await _queueAttachementDelete(row['background_url']);
      return jam;
    }

    if (isImageUploaded) {
      if (hadBackground) {
        await _queueAttachementDelete(row['background_url']);
      }
      await _queueAttachemntUpload(jam, imageUrl!);
    }

    return jam;
  }

  @override
  Future<JamModel> queueUpdateVibes(JamModel jam) {
    // TODO: implement queueUpdateVibes
    throw UnimplementedError();
  }

  Future _queueAttachemntUpload(JamModel jam, String imageId) async {
    final imagePath = jam.image!.path;
    final imageSize = await jam.image!.length();
    final storageDirectory = await jamAttachmentQueue.getStorageDirectory();

    final destinationPath = path.join(
      storageDirectory,
      path.basename(imageId),
    );

    await jamAttachmentQueue.localStorage.copyFile(
      imagePath,
      destinationPath,
    );

    await jamAttachmentQueue.savePhoto(
      imageId,
      imageSize,
    );
  }

  Future _queueAttachementDelete(String jamId) async {
    await jamAttachmentQueue.deletePhoto(jamId);
  }
}

final jamQueueProvider = Provider<JamQueue>((ref) => JamQueue());
