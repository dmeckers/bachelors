import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

final class SocialRepository
    with SupabaseUserGetter
    implements SocialRepositoryInterface {
  static const CHECK_USER_HAS_INVITE_RPC = 'check_user_has_ivnite';
  static const GET_USER_FRIENDS = 'get_user_friends';

  @override
  final SocialQueueInterface queue;

  final ProviderRef _ref;

  SocialRepository(this._ref, this.queue);

  @override
  Future<bool> sendFriendInvite({required String userId}) async {
    if (!(await isOnline(_ref))) {
      return await queue.queueSendFriendInvite(userId: userId);
    }

    await supabase.from('friend_invites').insert(
      {'user_sent': supabase.auth.currentUser!.id, 'user_received': userId},
    );
    return true;
  }

  @override
  Future<void> acceptFriendInvite({required String friendInviteId}) async {
    return !(await isOnline(_ref))
        ? await queue.queueAcceptFriendInvite(friendInviteId: friendInviteId)
        : await supabase
            .from('friend_invites')
            .update({'status': 'accepted'}).eq('id', friendInviteId);
  }

  @override
  Future<void> rejectFriendInvite({required String friendInviteId}) async {
    return !(await isOnline(_ref))
        ? await queue.queueRejectFriendInvite(friendInviteId: friendInviteId)
        : await supabase
            .from('friend_invites')
            .delete()
            .eq('id', friendInviteId);
  }

  @override
  Future<UserWithRelationshipStatus> getRelationshipStatus({
    required String userId,
  }) async {
    // if (!(await isOnline(_ref))) {
    //   return await _ref
    //       .read(powerSyncSocialServiceProvider)
    //       .checkInviteSent(userId: userId);
    // }

    final response = await supabase.rpc(CHECK_USER_HAS_INVITE_RPC, params: {
      'user_id': userId,
      'current_user_id': getUserIdOrThrow(),
    }) as Dynamics;

    return (
      status: RelationshipStatus.fromString(
        response.first['relationship_status'],
      ),
      user: UserProfileModel.fromJson(response.first['profile'])
    );
  }

  @override
  Future<FriendInvites> getFriendInvites() async {
    return !(await isOnline(_ref))
        ? await _ref.read(powerSyncSocialServiceProvider).getFriendInvites()
        : await _getFriendInvites(received: true);
  }

  @override
  Future<FriendInvites> getSentFriendInvites() async =>
      await _getFriendInvites(received: false);

  Future<FriendInvites> _getFriendInvites({
    required bool received,
  }) async {
    return await supabase
        .from('friend_invites')
        .select("""
                  id ,
                  sent_at:inserted_at ,
                  status ,
                  user_received ,
                  user_sent ,
                  profiles!friend_invites_user_sent_fkey(
                    username,
                    avatar
                  )
                """)
        .eq(
          received ? 'user_received' : 'user_sent',
          getUserIdOrThrow(),
        )
        .withConverter<FriendInvites>(
          (data) => data
              .map(
                (e) => FriendInviteModel.fromJson(e.flatten()),
              )
              .toList(),
        );
  }

  @override
  Future<Users> getFriends() async {
    return !(await isOnline(_ref))
        ? await _ref.read(powerSyncSocialServiceProvider).getFriends()
        : await supabase.rpc(
            GET_USER_FRIENDS,
            params: {'user_id': getUserIdOrThrow()},
          ).withConverter<Users>(
            (data) => (data as Dynamics)
                .cast<Json>()
                .map(UserProfileModel.fromJson)
                .toList(),
          );
  }

  @override
  Future<JamInvites> getJamInvites() async {
    return !(await isOnline(_ref))
        ? await _ref.read(powerSyncSocialServiceProvider).getJamInvites()
        : await supabase
            .from('jam_invites')
            .select("""
                  * ,
                  jam:jams!jam_invites_jam_id_fkey(
                    name
                  ),
                  sender:profiles!jam_invites_sended_from_user_id_fkey(
                      id,username,
                      full_name,
                      avatar,
                      last_active_at
                  )
                """)
            .eq('status', 'pending')
            .eq('invited_user_id', getUserIdOrThrow())
            .withConverter<JamInvites>(
              (data) => data.map(JamInviteModel.fromJson).toList(),
            );
  }

  @override
  Future<JamInvites> getSentJamInvites() async {
    return !(await isOnline(_ref))
        ? await _ref.read(powerSyncSocialServiceProvider).getSentJamInvites()
        : await supabase.rpc<Jsons>('get_sent_invites_with_profiles', params: {
            'user_id': getUserIdOrThrow(),
          }).withConverter<JamInvites>(
            (data) => data.map(JamInviteModel.fromJson).toList(),
          );
  }

  @override
  Future<void> sendJamInvite({
    required int jamId,
    required Strings userIds,
  }) async {
    return !(await isOnline(_ref))
        ? await queue.queueSendJamInvite(jamId: jamId, userIds: userIds)
        : await supabase.from('jam_invites').insert(
              userIds
                  .map(
                    (userId) => {
                      'jam_id': jamId,
                      'invited_user_id': userId,
                      'sended_from_user_id': getUserIdOrThrow(),
                    },
                  )
                  .toList(),
            );
  }

  @override
  Future<void> acceptJamInvite({required int inviteId}) async {
    return !(await isOnline(_ref))
        ? await queue.queueAcceptJamInvite(jamInviteId: inviteId)
        : await supabase.from('jam_invites').update({'status': 'accepted'}).eq(
            'id',
            inviteId,
          );
  }

  @override
  Future<void> rejectJamInvite({required int inviteId}) async {
    return !(await isOnline(_ref))
        ? await queue.queueRejectJamInvite(jamInviteId: inviteId)
        : await supabase
            .from('jam_invites')
            .update({'status': 'rejected'}).eq('id', inviteId);
  }
}

final socialRepositoryProvider = Provider<SocialRepositoryInterface>(
  (ref) => SocialRepository(
    ref,
    ref.read(socialQueueProvider),
  ),
);
