import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vibes_controller.g.dart';

typedef VibesCollection = List<VibeModel>;

@riverpod
class UserVibesController extends _$VibesController with SupabaseUserGetter {
  @override
  FutureOr<VibesCollection> build() async =>
      ref.read(vibesRepositoryProvider).getVibesByUserId(
            userId: getUserIdOrThrow(),
          );
}

@riverpod
class VibesController extends _$VibesController {
  @override
  FutureOr<VibesCollection> build() {
    return [];
  }

  Future<void> searchVibes({required String query}) async {
    final vibesRepo = ref.read(vibesRepositoryProvider);
    state = const AsyncLoading<VibesCollection>();
    state = await AsyncValue.guard(
      () => vibesRepo.searchVibes(query: query),
    );
  }

  Future<void> searchVibesAI({required String query}) async {
    // if(ref.read(connectivityStatusProvider.notifier).state == ConnectionStatus.isDisconnected){
    //   return;
    // }

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
