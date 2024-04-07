import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/subjects.dart';

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class UserState extends WidgetsBindingObserver with Storer {
  final _state = BehaviorSubject<UserProfileModel>();

  UserState({required this.userRepo, required this.vibesRepo});

  final UserProfileRepositoryInterface userRepo;
  final VibesRepositoryInterface vibesRepo;

  Stream<UserProfileModel> user$() async* {
    final profile = await userRepo.getCurrentUserProfile();
    refresh<UserProfileModel>(profile);
    _state.value = profile;
    yield* _state.stream.asBroadcastStream();
  }

  void updateUserName({required String username}) {
    final profile = _state.value.copyWith(username: username);
    _state.value = profile;
    userRepo.updateUserName(username: username);
    refresh<UserProfileModel>(profile);
  }

  void updateProfileStatus({required String status}) {
    final profile = _state.value.copyWith(profileStatus: status);
    _state.value = profile;
    userRepo.updateProfileStatus(status: status);
    refresh<UserProfileModel>(profile);
  }

  Future<void> addProfilePhoto({required File image}) async {
    final imageUrl = await userRepo.images.addProfilePhoto(image: image);

    final profile = _state.value.copyWith(
      photoUrls: [imageUrl, ...(_state.value.photoUrls ?? List.empty())],
      avatar: _state.value.avatar ?? imageUrl,
    );

    _state.value = profile;
    refresh<UserProfileModel>(profile);
  }

  void updateVibes({required List<VibeModel> vibes}) {
    final profile = _state.value.copyWith(vibes: vibes);
    _state.value = profile;
    vibesRepo.updateVibes(vibes: vibes);
    refresh<UserProfileModel>(profile);
  }

  void deleteProfilePhoto({required String photoId}) {
    final filtered = _state.value.photoUrls
            ?.where((url) => url.split('/').last != photoId)
            .toList() ??
        [];

    final newAvatar = filtered.isEmpty ? null : filtered.first;
    final profile = _state.value.copyWith(
      photoUrls: filtered,
      avatar: newAvatar,
    );

    _state.value = profile;
    refresh<UserProfileModel>(profile);

    userRepo.images.deleteProfilePhoto(photoId: photoId);
  }

  void setMainAvatar(String? fileName) {
    final profile = _state.value.copyWith(avatar: fileName);
    _state.value = profile;
    refresh<UserProfileModel>(profile);
    userRepo.images.setMainAvatar(fileName);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.hidden ||
        state == AppLifecycleState.detached) {
      store<UserProfileModel>(_state.value);
    }
  }
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
  (ref) {
    final userState = ref.read(userStateProvider);

    WidgetsBinding.instance.addObserver(userState);

    return userState.user$();
  },
);
