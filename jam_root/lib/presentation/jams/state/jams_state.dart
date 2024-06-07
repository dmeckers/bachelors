import 'package:jam/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class JamsState with Storer {
  final _state = BehaviorSubject<Jams>();

  JamsState({required this.userRepo});

  final UserProfileRepositoryInterface userRepo;

  Stream<Jams> jams$() async* {
    final cached = hiveGet<UserProfileModel>();
    if (cached != null) {
      _state.value = cached.jams;
      yield cached.jams;
    }

    final profile = await userRepo.getCurrentUserProfile();

    _state.value = profile.jams;

    yield* _state.stream
        .doOnData(
          (jams) => hiveRefresh<UserProfileModel>(
            profile.copyWith(jams: jams),
          ),
        )
        .asBroadcastStream();
  }

  Future invalidate() async {
    final profile = await userRepo.getCurrentUserProfile();

    _state.value = profile.jams;
  }

  updateJam(JamModel jam) {
    _state.value = [jam, ..._state.value.where((j) => jam.id != j.id)];
  }

  Jams get jams => _state.value;
}

final jamsStateProvider = Provider<JamsState>(
  (ref) {
    final userRepoProvider =
        ref.read(profileRepositoryProvidersProvider).userProfileRepository;

    return JamsState(
      userRepo: ref.read(userRepoProvider),
    );
  },
);

final jams$ = StreamProvider.autoDispose(
  (ref) => ref.read(jamsStateProvider).jams$(),
);
