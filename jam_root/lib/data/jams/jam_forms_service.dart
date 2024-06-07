import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class JamFormsService
    with SupabaseUserGetter, Storer
    implements JamFormsServiceInterface {
  @override
  final JamRepositoryInterface repo;

  JamFormsService({required this.repo});

  @override
  Future updateJamForm({
    required int jamId,
    required BaseJamFormModel form,
  }) async {
    await supabase.from('jams').update({'form': form.toJson()}).eq('id', jamId);
  }

  @override
  Future<BaseJamFormModel> getJamForm({required int jamId}) async {
    return await supabase
        .from('jams')
        .select('form')
        .eq('id', jamId)
        .single()
        .withConverter<BaseJamFormModel>(
          (json) => BaseJamFormModel.fromJson(
            json['form'],
          ),
        );
  }

  @override
  Future<void> sendRequestForJoin({required int jamId}) async {
    await supabase.from('jam_join_requests').insert(
      {'user_id': getUserIdOrThrow(), 'jam_id': '$jamId'},
    );
  }

  @override
  Future<void> submitFormAndJoin({
    required int jamId,
    required String? creatorFcmToken,
    required BaseJamFormModel form,
  }) async {
    await _postForm(jamId.toString(), form);
    await repo.joinJam(jamId: jamId);

    if (creatorFcmToken.isEmptyOrNull) return;

    final user = hiveGet<UserProfileModel>();

    await PushNotificationsService.sendNotification(
        NotificationTypeEnum.sendJamFormSubmittedJoinedNotification, {
      'creator_fcm_token': creatorFcmToken,
      'joined_user_name': '${user?.username ?? user?.fullName} ',
    });
  }

  @override
  Future<void> submitFormAndSendRequest({
    required int jamId,
    required String? creatorFcmToken,
    required BaseJamFormModel form,
  }) async {
    await _postForm(jamId.toString(), form);

    if (creatorFcmToken.isEmptyOrNull) return;

    await PushNotificationsService.sendNotification(
        NotificationTypeEnum.sendJamFormSubmittedNotification, {
      'creator_fcm_token': creatorFcmToken,
    });
  }

  Future<void> _postForm(String jamId, BaseJamFormModel form) async {
    final values = {
      'jam_id': jamId,
      'user_id': supabase.auth.currentUser!.id,
      'filled_form': form.toJson(),
    };

    await supabase.from('jam_join_requests').insert(values);
  }

  @override
  Future<bool> hasUserFilledForm({required int jamId}) async {
    final filled = await supabase
        .from('jam_join_requests')
        .select()
        .eq('jam_id', jamId)
        .eq('user_id', supabase.auth.currentUser!.id);

    return filled.isNotEmpty;
  }
}

final jamFormsServiceProvider = Provider(
  (ref) => JamFormsService(
    repo: ref.read(jamRepositoryProvider),
  ),
);
