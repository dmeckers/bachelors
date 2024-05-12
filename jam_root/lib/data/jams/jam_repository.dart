import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

final class JamsRepository extends JamRepositoryInterface
    with SupabaseUserGetter {
  JamsRepository(
    this._ref,
    this.queue,
    this.attachmentService,
  );

  static const GET_JAM_BY_ID_RPC = 'get_jam_by_id';
  static const POST_RPC = 'post_jam';
  static const GET_OWNER_JAMS_RPC = 'get_my_jams';
  static const GET_PARTICIPATED_JAMS_OUTDATED =
      'get_participated_jams_outdated';
  static const GET_PARTICIPATED_JAMS = 'get_participated_jams';
  static const UPDATE_RPC = 'update_jam';

  final ProviderRef _ref;

  @override
  final JamQueueInterface queue;

  @override
  final AttachmentServiceInterface attachmentService;

  @override
  Future<JamModel> createJam(JamModel jam) async {
    if (!await isOnline(_ref)) {
      return queue.queueCreate(jam);
    }

    final jamWithoutImage = jam.copyWith(image: null);

    final json = jamWithoutImage.backfilled.toJson();

    final jamId = await supabase.rpc(POST_RPC, params: json);
    final userId = getUserIdOrThrow();

    if (jam.image != null) {
      final fileName = await attachmentService.upload(file: jam.image!);
      await supabase
          .from('jams')
          .update({'background_url': fileName}).eq('id', jamId);
    }

    return jam.copyWith(id: jamId, creatorId: userId);
  }

  @override
  Future<JamModel> updateJamDetails(JamModel jam) async {
    if (!await isOnline(_ref)) return queue.queueUpdateDetails(jam);
    final hasNewImage = jam.image != null && jam.image!.path.trim().isNotEmpty;
    final json = jam.backfilled.toJson();

    if (!hasNewImage && !jam.dropBackground) {
      await supabase.rpc(
        UPDATE_RPC,
        params: json..putIfAbsent('background_url', () => null),
      );

      return jam;
    }

    final hasToReplace = hasNewImage && jam.backgroundUrl.isNotEmptyOrNull;
    final hasToUpload = hasNewImage && jam.backgroundUrl.isEmptyOrNull;
    String fileName = '';

    if (hasToReplace || jam.dropBackground) {
      await attachmentService.delete(jam.backgroundUrl!);
    }

    if (hasToUpload || hasToReplace) {
      fileName = await attachmentService.upload(file: jam.image!);
    }

    await supabase.rpc(
      UPDATE_RPC,
      params: json.replaceKeyValue(
        key: 'background_url',
        value: jam.dropBackground ? null : fileName,
      ),
    );

    return jam;
  }

  @override
  Future<void> deleteJam({required int jamId}) async {
    return !(await isOnline(_ref))
        ? await queue.queueDelete(jamId: jamId)
        : await supabase.from('jams').delete().eq('id', jamId);
  }

  @override
  Future<JamModel> getJam({required int jamId}) async {
    return !(await isOnline(_ref))
        ? await _ref.read(powersyncJamServiceProvider).getJam(jamId: jamId)
        : await supabase.rpc(
            GET_JAM_BY_ID_RPC,
            params: {'jamid': jamId},
          ).withConverter(
            (data) => JamModel.fromJson(data.first),
          );
  }

  @override
  Future<Jams> getActiveOwnerJams({required String userId}) async {
    return !(await isOnline(_ref))
        ? await _ref
            .read(powersyncJamServiceProvider)
            .getActiveOwnerJams(userId: userId)
        : await supabase.rpc(
            GET_OWNER_JAMS_RPC,
            params: {'user_id': userId},
          ).withConverter(_jamConverter);
  }

  @override
  Future<Jams> getParticipatedOutdatedJamsByUserId({
    required String userId,
  }) async {
    return !(await isOnline(_ref))
        ? await _ref
            .read(powersyncJamServiceProvider)
            .getParticipatedOutdatedJamsByUserId(userId: userId)
        : await supabase.rpc(
            GET_PARTICIPATED_JAMS_OUTDATED,
            params: {'user_id': userId},
          ).withConverter(_jamConverter);
  }

  @override
  Future<Jams> getActiveParticipatedJamsByUserId({
    required String userId,
  }) async {
    return !(await isOnline(_ref))
        ? await _ref
            .read(powersyncJamServiceProvider)
            .getActiveParticipatedJamsByUserId(userId: userId)
        : await supabase.rpc(
            GET_PARTICIPATED_JAMS,
            params: {'user_id': userId},
          ).withConverter(_jamConverter);
  }

  @override
  Future<bool> joinJam({required int jamId}) async {
    if (await isOnline(_ref)) return queue.queueJoin(jamId: jamId);

    await supabase.from('jams_users').insert({
      'user_id': getUserIdOrThrow(),
      'jam_id': jamId,
    });
    return true;
  }

  @override
  Future<Users> getJamParticipants({required int jamId}) async {
    return !(await isOnline(_ref))
        ? await _ref
            .read(powersyncJamServiceProvider)
            .getJamParticipants(jamId: jamId)
        : await supabase
            .from('jams_users')
            .select('profiles(*)')
            .eq('jam_id', jamId)
            .withConverter<Users>(
              (data) => data.map(UserProfileModel.fromJson).toList(),
            );
  }

  @override
  Future<JamModel> updateJamVibes(JamModel jam) {
    throw UnimplementedError();
  }

  Jams _jamConverter(dynamic data) =>
      (data as Dynamics).cast<Json>().map(JamModel.fromJson).toList();
}

final jamRepositoryProvider = Provider<JamRepositoryInterface>(
  (ref) => JamsRepository(
    ref,
    ref.read(jamQueueProvider),
    ref.read(
      attachmentServiceProvider(SupabaseBucketConfig.jamBackgrounds),
    ),
  ),
);
