import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/connectivity_checker.dart';

part 'edit_vibes.controller.g.dart';

typedef VibesCollection = List<VibeModel>;

@riverpod
class UserEditVibesController extends _$UserEditVibesController
    with SupabaseUserGetter {
  @override
  FutureOr<VibesCollection> build() async => ref
      .read(vibesRepositoryProvider)
      .getVibesByUserId(userId: getUserIdOrThrow());

  addVibe({required VibeModel vibe}) {
    state = AsyncValue.data([...state.requireValue, vibe]);
  }

  removeVibe({required VibeModel vibe}) {
    state = AsyncValue.data([...state.requireValue]..remove(vibe));
  }

  updateVibes({required VibesCollection vibes}) async {
    final vibes = state.requireValue;
    await ref.read(vibesRepositoryProvider).updateVibes(vibes: vibes);
  }
}

@riverpod
class SearchVibesController extends _$SearchVibesController {
  @override
  FutureOr<VibesCollection> build() {
    return [];
  }

  Future<void> searchVibes({required String query}) async {
    if (ref.read(connectivityStatusProvider) ==
        ConnectionStatus.isDisconnected) {
      return;
    }
    final vibesRepo = ref.read(vibesRepositoryProvider);
    state = const AsyncLoading<VibesCollection>();
    state = await AsyncValue.guard(
      () => vibesRepo.searchVibes(query: query),
    );
  }

  Future<void> searchVibesAI({required String query}) async {
    if (ref.read(connectivityStatusProvider) ==
        ConnectionStatus.isDisconnected) {
      return;
    }

    final vibesRepo = ref.read(vibesRepositoryProvider);
    state = const AsyncLoading<VibesCollection>();
    state = await AsyncValue.guard(
      () => vibesRepo.searchVibesAI(query: query),
    );
  }

  Future<void> getVibesByUserId({required String userId}) async {
    state = const AsyncLoading<VibesCollection>();
    state = await AsyncValue.guard(
      () => ref.read(vibesRepositoryProvider).getVibesByUserId(userId: userId),
    );
  }
}
