import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
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
  Future<JamModel> createJam({required JamModel jamModel}) async {
    if (!await isOnline(_ref)) {
      return queue.queueCreate(jamModel);
    }

    final jamWithoutImage = jamModel.copyWith(image: null);

    final json = jamWithoutImage.filledWithDefaults.toJson();
    final jamId = await supabase.rpc(POST_RPC, params: json);
    final userId = getUserIdOrThrow();

    if (jamModel.image.isNotNull) {
      await supabase.from('jams').update(
        {
          'background_url':
              await attachmentService.upload(file: jamModel.image!)
        },
      ).eq('id', jamId);
    }

    return jamModel.copyWith(id: jamId, creatorId: userId);
  }

  @override
  Future<JamModel> updateJamDetails(JamModel jam) async {
    if (!await isOnline(_ref)) return queue.queueUpdateDetails(jam);
    final hasNewImage = jam.image != null && jam.image!.path.trim().isNotEmpty;
    final json = jam.filledWithDefaults.toJson();

    if (!hasNewImage && !jam.dropBackground) {
      await supabase.rpc(
        UPDATE_RPC,
        params: {
          'background_url': jam.backgroundUrl,
          'date': '${jam.date}',
          'description': jam.description,
          'extra_information': jam.extraInformation,
          'icon_url': jam.iconUrl,
          'id': jam.id,
          'invites_per_member': jam.invitesPerMember,
          'join_type': jam.joinType.name,
          'location': json['location'],
          'location_name': jam.locationName,
          'max_participants': jam.maxParticipants,
          'name': jam.name,
          'related_vibes': json['related_vibes'],
        },
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
      params: {
        'background_url': jam.dropBackground ? null : fileName,
        'date': '${jam.date}',
        'description': jam.description,
        'extra_information': jam.extraInformation,
        'icon_url': jam.iconUrl,
        'id': jam.id,
        'invites_per_member': jam.invitesPerMember,
        'join_type': jam.joinType.name,
        'location': json['location'],
        'location_name': jam.locationName,
        'max_participants': jam.maxParticipants,
        'name': jam.name,
        'related_vibes': json['related_vibes'],
      },
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
            params: {'jamid': jamId, 'user_id': getUserIdOrThrow()},
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
    // if (await isOnline(_ref)) return queue.queueJoin(jamId: jamId);
    final payload = {
      'user_id': getUserIdOrThrow(),
      'jam_id': jamId,
    };

    await supabase.from('jams_users').insert(payload);
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

  @override
  Future<List<BaseJamFormModel>> getJamJoinRequests({
    required int jamId,
  }) async {
    return await supabase
        .from('jam_join_requests')
        .select()
        .eq('jam_id', jamId)
        .withConverter<List<BaseJamFormModel>>(
          (data) => data.map(BaseJamFormModel.fromJson).toList(),
        );
  }

  @override
  Future<void> acceptJoinRequest({
    required int jamId,
    required int joinRequestId,
    required String userId,
  }) async {
    await supabase.from('jam_join_requests').update({
      'status': ProcessStepTypeEnum.accepted.name,
    }).eq('id', joinRequestId);

    await supabase.from('jams_users').insert({
      'user_id': userId,
      'jam_id': jamId,
    });

    final response = await supabase
        .from('profiles')
        .select('fcm_token')
        .eq('id', userId)
        .single();

    PushNotificationsService.sendNotification(
        NotificationTypeEnum.sendJamRequestAcceptedNotification, {
      'user_fcm_token': response['fcm_token'],
    });
  }

  @override
  Future<void> freezeRequest({
    required int jamId,
    required int joinRequestId,
    required String userId,
  }) async {
    await supabase.from('jam_join_requests').update({
      'status': ProcessStepTypeEnum.freezed.name,
    }).eq('id', joinRequestId);
  }

  @override
  Future<void> rejectJoinRequest({
    required int jamId,
    required int joinRequestId,
    required String userId,
  }) async {
    await supabase.from('jam_join_requests').update({
      'status': ProcessStepTypeEnum.declined.name,
    }).eq('id', joinRequestId);
  }

  @override
  Future<void> unfreezeRequest({
    required int jamId,
    required int joinRequestId,
    required String userId,
  }) async {
    await supabase.from('jam_join_requests').update({
      'status': ProcessStepTypeEnum.pending.name,
    }).eq('id', joinRequestId);
  }
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
