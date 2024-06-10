import 'package:jam/domain/events/map/jam_deleted_map_event.dart';
import 'package:jam/domain/events/map/jam_updated_map_event.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

part 'jam_controller.g.dart';

@riverpod
final class UserJamController extends _$UserJamController
    with SupabaseUserGetter {
  @override
  FutureOr<Jams> build() {
    return ref.read(jamRepositoryProvider).getActiveOwnerJams(
          userId: getUserIdOrThrow(),
        );
  }
}

@riverpod
Future<JamModel> getJamById(GetJamByIdRef ref, {required int jamId}) async =>
    await ref.read(jamRepositoryProvider).getJam(jamId: jamId);

@riverpod
Future<Jams> getOutdatedJams(GetOutdatedJamsRef ref) async {
  return await ref
      .read(jamRepositoryProvider)
      .getParticipatedOutdatedJamsByUserId(
        userId: SupabaseUserGetter.getOrThrow(),
      );
}

@riverpod
Future<Jams> getParticipatingJams(GetParticipatingJamsRef ref) async {
  return await ref
      .read(jamRepositoryProvider)
      .getActiveParticipatedJamsByUserId(
        userId: SupabaseUserGetter.getOrThrow(),
      );
}

@riverpod
Future<Jams> updateJam(
  UpdateJamRef ref, {
  required JamModel jam,
}) async {
  final updated = await ref.read(jamRepositoryProvider).updateJamDetails(jam);
  await ref
      .read(mapRealtimeProvider)
      .fireEvent(JamUpdatedEvent.fromModel(updated));
  ref.invalidate(userJamControllerProvider);

  return [updated];
}

@riverpod
Future<List<BaseJamFormModel>> getJamJoinRequests(
  GetJamJoinRequestsRef ref, {
  required int jamId,
}) async {
  return await ref.read(jamRepositoryProvider).getJamJoinRequests(jamId: jamId);
}

@riverpod
Future<BaseJamFormModel> getJamForm(
  GetJamFormRef ref, {
  required int jamId,
}) {
  return ref.read(jamFormsServiceProvider).getJamForm(jamId: jamId);
}

@riverpod
Future<JamModel> createJam(CreateJamRef ref, {required JamModel jam}) async {
  final jamModel = await ref.read(jamRepositoryProvider).createJam(
        jamModel: jam,
      );

  ref.invalidate(userJamControllerProvider);

  final coords = jam.location.extractCords();

  ref.read(mapWidgetStateControllerProvider).pushJam(
        jamLocation: jamModel.toLocationModel().copyWith(
              marker: JamMarker.getUserJamMarker(),
              latitude: coords.lat,
              longitude: coords.lon,
            ),
        popTempMarker: true,
      );

  ref
      .read(mapRealtimeProvider)
      .fireEvent(NewJamCreatedEvent.fromModel(jamModel));

  return jamModel;
}

@riverpod
Future<void> deleteJam(DeleteJamRef ref, {required JamModel jam}) async {
  await ref.read(jamRepositoryProvider).deleteJam(jamId: jam.id!);
  await ref.read(mapRealtimeProvider).fireEvent(
        JamDeletedMapEvent.fromModel(jam),
      );
  ref.invalidate(userJamControllerProvider);
}

@riverpod
final class JamCardViewState extends _$JamCardViewState {
  @override
  JamCardView build() =>
      localDatabase.get(HiveConstants.LOCAL_DB_JAM_CARD_VIEW_KEY)
          as JamCardView? ??
      JamCardView.big;

  void toggle() {
    final cardView = localDatabase.get(HiveConstants.LOCAL_DB_JAM_CARD_VIEW_KEY)
            as JamCardView? ??
        JamCardView.big;
    final newCardView =
        JamCardView.values[(cardView.index + 1) % JamCardView.values.length];

    localDatabase.put(HiveConstants.LOCAL_DB_JAM_CARD_VIEW_KEY, newCardView);
    state = newCardView;
  }
}

@riverpod
Future<JamInvites> getJamInvites(GetJamInvitesRef ref) async =>
    ref.read(socialRepositoryProvider).getJamInvites();

@riverpod
Future<void> sendJamInvites(
  SendJamInvitesRef ref, {
  required int jamId,
  required Users users,
}) async {
  await ref
      .read(socialRepositoryProvider)
      .sendJamInvite(jamId: jamId, userIds: users.map((e) => e.id).toList());

  await PushNotificationsService.sendNotification(
    NotificationTypeEnum.sendInviteJamNotification,
    {
      'users_fcm_token': [...users.map((e) => e.fcmToken)],
    },
  );
}

@riverpod
Future<JamInvites> getSentJamInvites(GetSentJamInvitesRef ref) async =>
    ref.read(socialRepositoryProvider).getSentJamInvites();

@riverpod
Future<List<FriendInviteModel>> getSentFriendInvites(
  GetSentFriendInvitesRef ref,
) async =>
    await ref.read(socialRepositoryProvider).getSentFriendInvites();

@riverpod
Future<Users> getJamParticipants(
  GetJamParticipantsRef ref, {
  required int jamId,
}) async =>
    ref.read(jamRepositoryProvider).getJamParticipants(jamId: jamId);

@riverpod
Future<(JamInvites, Users)> getJamInvitesAndParticipants(
  GetJamInvitesAndParticipantsRef ref, {
  required int jamId,
}) async {
  return (
    await ref.read(socialRepositoryProvider).getSentJamInvites(),
    await ref.read(jamRepositoryProvider).getJamParticipants(jamId: jamId),
  );
}

@riverpod
final class JamDetailsState extends _$JamDetailsState {
  @override
  FutureOr<JamModel> build(int jamId) async {
    final jam = await ref.read(jamRepositoryProvider).getJam(jamId: jamId);

    return jam;
  }

  void declineJoinRequest(int requestId, String userId) async {
    _updateStatus(requestId, ProcessStepTypeEnum.declined);
    await ref.read(jamRepositoryProvider).rejectJoinRequest(
          jamId: jamId,
          joinRequestId: requestId,
          userId: userId,
        );
  }

  void acceptJoinRequest(int requestId, String userId) async {
    _updateStatus(requestId, ProcessStepTypeEnum.accepted);
    await ref.read(jamRepositoryProvider).acceptJoinRequest(
          jamId: jamId,
          joinRequestId: requestId,
          userId: userId,
        );
  }

  void _updateStatus(int requestId, ProcessStepTypeEnum status) {
    state = state.when(
      data: (data) => AsyncData(data.copyWith(
        joinRequests: data.joinRequests
            .map((e) => e.id == requestId ? e.copyWith(status: status) : e)
            .toList(),
      )),
      error: (error, s) => AsyncError(error, s),
      loading: () => const AsyncValue.loading(),
    );
  }

  void updateSeenAt(int requestId) async {
    await supabase
        .from('jam_join_requests')
        .update({'seen_at': "${DateTime.now()}"}).eq('id', requestId);

    state = state.when(
      data: (data) => AsyncData(data.copyWith(
        joinRequests: data.joinRequests
            .map((e) =>
                e.id == requestId ? e.copyWith(seenAt: DateTime.now()) : e)
            .toList(),
      )),
      error: (error, s) => AsyncError(error, s),
      loading: () => const AsyncValue.loading(),
    );
  }
}

@riverpod
Future<List<UserProfileModel>> getUsersByIds(
  GetUsersByIdsRef ref, {
  required List<String> userIds,
}) async {
  final providers = ref.read(profileRepositoryProvidersProvider);

  final users = await ref
      .read(providers.userProfileRepository)
      .getUsers(userIds: userIds);

  return users;
}
