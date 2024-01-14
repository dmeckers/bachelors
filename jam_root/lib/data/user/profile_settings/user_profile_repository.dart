import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart' as utils;
import 'package:riverpod_annotation/riverpod_annotation.dart';

final class UserProfileRepository
    with SupabaseUserGetter
    implements UserProfileRepositoryInterface {
  static const GET_USER_FULL_RPC = 'get_user_full';

  @override
  final UserProfileImagesRepositoryInterface images;

  @override
  final SocialRepositoryInterface social;

  @override
  final ProfileQueueInterface queue;

  final ProviderRef _ref;

  const UserProfileRepository(
    this.images,
    this.social,
    this.queue,
    this._ref,
  );

  @override
  Future<UserProfileModel> getCurrentUserProfile() async {
    final userId = getUserIdOrThrow();
    UserProfileModel? profile;

    if (!(await utils.isOnline(_ref))) {
      profile = await _ref
          .read(powersyncUserProfileServiceProvider)
          .getUserProfileById(userId: userId);
    } else {
      final response = await supabase.rpc(
        GET_USER_FULL_RPC,
        params: {'user_id': userId},
      ) as Dynamics;

      final rawData = response.first['data'] as Json;
      final data = (rawData['user_info'] as Json)
        ..flatten()
        ..['vibes'] = rawData['vibes']
        ..['friends'] = rawData['friends'];

      profile = UserProfileModel.fromJson(data);
    }

    return profile.copyWith(
      friends: await social.getFriends(),
      photoUrls: await images.getUserAvatars(),
    );
  }

  @override
  Future<void> updateUserName({required String username}) async {
    !(await utils.isOnline(_ref))
        ? queue.queueUpdateUserName(username: username)
        : await supabase
            .from('profiles')
            .update({'username': username}).eq('id', getUserIdOrThrow());
  }

  @override
  Future<void> updateProfileStatus({required String status}) async {
    !(await utils.isOnline(_ref))
        ? await queue.queueUpdateProfileStatus(status: status)
        : await supabase
            .from('profiles')
            .update({'profile_status': status}).eq('id', getUserIdOrThrow());
  }

  @override
  Future<void> updateOnlineStatus({required bool onlineStatus}) async {
    if (!(await utils.isOnline(_ref))) {
      return await queue.queueUpdateOnlineStatus(isOnline: onlineStatus);
    }

    if (supaUser == null) return;

    await supabase.from('profiles').update(
      {
        'is_online': onlineStatus,
        'last_sign_in_at': DateTime.now().toString(),
      },
    ).eq('id', getUserIdOrThrow());
  }

  @override
  Future<UserProfileModel> getUserProfileById({required String userId}) async {
    final UserProfileModel profile;
    if (!(await utils.isOnline(_ref))) {
      profile = await _ref
          .read(powersyncUserProfileServiceProvider)
          .getUserProfileById(userId: userId);
    } else {
      {
        final response = await supabase.rpc(
          GET_USER_FULL_RPC,
          params: {'user_id': userId},
        ) as Dynamics;

        final rawData = response.first['data'] as Json;
        final data = (rawData['user_info'] as Json)
          ..flatten()
          ..['vibes'] = rawData['vibes']
          ..['friends'] = rawData['friends'];

        profile = UserProfileModel.fromJson(data);
      }
    }

    return profile.copyWith(
      photoUrls: await images.getUserAvatars(userId: userId),
    );
  }
}
