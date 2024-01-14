import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
Future<JamModel> getJamById(GetJamByIdRef ref, {required int jamId}) async {
  return await ref.read(jamRepositoryProvider).getJam(jamId: jamId);
}

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
  return [await ref.read(jamRepositoryProvider).updateJamDetails(jam)];
}

@riverpod
Future<JamModel> createJam(CreateJamRef ref, {required JamModel jam}) async {
  return await ref.read(jamRepositoryProvider).createJam(jam);
}

@riverpod
Future<void> deleteJam(DeleteJamRef ref, {required int jamId}) async {
  await ref.read(jamRepositoryProvider).deleteJam(jamId: jamId);
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
Future<JamInvites> getJamInvites(GetJamInvitesRef ref) async {
  return ref.read(socialRepositoryProvider).getJamInvites();
}

@riverpod
Future<void> sendJamInvites(
  SendJamInvitesRef ref, {
  required int jamId,
  required Strings userIds,
}) async {
  return ref
      .read(socialRepositoryProvider)
      .sendJamInvite(jamId: jamId, userIds: userIds);
}

@riverpod
Future<JamInvites> getSentJamInvites(GetSentJamInvitesRef ref) async {
  return ref.read(socialRepositoryProvider).getSentJamInvites();
}

@riverpod
Future<Users> getJamParticipants(
  GetJamParticipantsRef ref, {
  required int jamId,
}) async {
  return ref.read(jamRepositoryProvider).getJamParticipants(jamId: jamId);
}

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
Future<List<(int, String)>> getJamNamesByIds(
  GetJamNamesByIdsRef ref, {
  required Integers jamIds,
}) async {
  return await ref.read(jamRepositoryProvider).getJamNamesByIds(jamIds: jamIds);
}

@riverpod
Future<void> acceptJamInvite(
  AcceptJamInviteRef ref, {
  required int inviteId,
}) async {
  return ref.read(socialRepositoryProvider).acceptJamInvite(inviteId: inviteId);
}

@riverpod
Future<void> declineJamInvite(
  DeclineJamInviteRef ref, {
  required int inviteId,
}) async {
  return ref.read(socialRepositoryProvider).rejectJamInvite(inviteId: inviteId);
}
