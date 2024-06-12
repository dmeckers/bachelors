import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

final _userProfileImagesRepositoryProvider =
    Provider<UserProfileImagesRepositoryInterface>(
  (ref) => SupabaseUserProfileImagesRepositoryInterface(
    ref,
    ref.read(
      attachmentServiceProvider(SupabaseBucketConfig.avatars),
    ),
  ),
);

final _userProfileRepository = Provider<UserProfileRepositoryInterface>(
  (ref) => UserProfileRepository(
    ref.read(_userProfileImagesRepositoryProvider),
    ref.read(socialRepositoryProvider),
    ref.read(profileQueueProvider),
    ref,
  ),
);

final _privacySettingsQueueProvider = Provider<PrivacySettingsQueue>(
  (ref) => PrivacySettingsQueue(),
);

final _userPrivacyRepositoryProvider =
    Provider<UserPrivacySettingsRepositoryInterface>(
  (ref) => UserPrivacySettingsRepository(),
);

final _currentUserProfileProvider = FutureProvider<UserProfileModel>(
  (ref) async =>
      await ref.watch(_userProfileRepository).getCurrentUserProfile(),
);

final _otherUserProfileProvider =
    FutureProvider.family<UserProfileModel, String>(
  (ref, userId) async => await ref
      .watch(_userProfileRepository)
      .getUserProfileById(userId: userId),
);

final _getUserInfoProvider = FutureProvider.family<UserProfileModel, String>(
  (ref, userId) async =>
      await ref.read(_userProfileRepository).getUserProfileById(userId: userId),
);

mixin class ProfileRepositoryProviders {
  Provider<UserPrivacySettingsRepositoryInterface>
      get userPrivacyRepositoryProvider => _userPrivacyRepositoryProvider;

  Provider<UserProfileRepositoryInterface> get userProfileRepository =>
      _userProfileRepository;

  FutureProvider<UserProfileModel> get currentUserProfileProvider =>
      _currentUserProfileProvider;

  FutureProviderFamily<UserProfileModel, String> get otherUserProfileProvider =>
      _otherUserProfileProvider;

  Provider<UserProfileImagesRepositoryInterface>
      get userProfileImagesRepository => _userProfileImagesRepositoryProvider;

  FutureProviderFamily<UserProfileModel, String> get getUserInfoProvider =>
      _getUserInfoProvider;
}

final profileRepositoryProvidersProvider = Provider<ProfileRepositoryProviders>(
  (ref) => ProfileRepositoryProviders(),
);
