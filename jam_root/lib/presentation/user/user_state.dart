import 'dart:io';

import 'package:jam/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class UserState with Storer {
  final _state = BehaviorSubject<UserProfileModel>();

  UserState({required this.userRepo, required this.vibesRepo});

  final UserProfileRepositoryInterface userRepo;
  final VibesRepositoryInterface vibesRepo;

  Stream<UserProfileModel> user$() async* {
    UserProfileModel currentUser;

    final cached = hiveGet<UserProfileModel>();

    currentUser = cached ?? await userRepo.getCurrentUserProfile();

    _state.value = currentUser;

    yield* _state.stream
        .doOnData(
          (userModel) => hiveRefresh<UserProfileModel>(userModel),
        )
        .asBroadcastStream();
  }

  void updateUserName({required String username}) {
    final profile = _state.value.copyWith(username: username);
    _state.value = profile;
    userRepo.updateUserName(username: username);
  }

  void updateProfileStatus({required String status}) {
    final profile = _state.value.copyWith(profileStatus: status);
    _state.value = profile;
    userRepo.updateProfileStatus(status: status);
  }

  Future<void> addProfilePhoto({required File image}) async {
    final imageUrl = await userRepo.images.addProfilePhoto(image: image);

    final profile = _state.value.copyWith(
      photoUrls: [imageUrl, ...(_state.value.photoUrls ?? List.empty())],
      avatar: _state.value.avatar ?? imageUrl,
    );

    _state.value = profile;
  }

  void updateVibes({required Vibes vibes}) {
    if (!_state.hasValue) return;

    final profile = _state.value.copyWith(vibes: vibes);
    _state.value = profile;
  }

  Future<void> deleteProfilePhoto({required String photoId}) async {
    final newAvatar =
        await userRepo.images.deleteProfilePhoto(photoId: photoId);

    final filtered = _state.value.photoUrls
            ?.where((url) => !url.contains(photoId))
            .toList() ??
        [];

    final profile = _state.value.copyWith(
      photoUrls: filtered,
      avatar: newAvatar,
    );

    _state.value = profile;
  }

  void setMainAvatar(String? fileName) {
    final profile = _state.value.copyWith(avatar: fileName);
    _state.value = profile;
    userRepo.images.setMainAvatar(fileName);
  }

  UserProfileModel getLastValue() =>
      _state.hasValue ? _state.value : hiveGet<UserProfileModel>()!;
}

final userStateProvider = Provider<UserState>(
  (ref) {
    final userRepoProvider =
        ref.read(profileRepositoryProvidersProvider).userProfileRepository;

    return UserState(
      userRepo: ref.read(userRepoProvider),
      vibesRepo: ref.read(vibesRepositoryProvider),
    );
  },
);

final user$ = StreamProvider.autoDispose(
  (ref) => ref.read(userStateProvider).user$(),
);
