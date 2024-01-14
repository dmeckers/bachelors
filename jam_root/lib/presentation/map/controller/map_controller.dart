import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'map_controller.g.dart';

@riverpod
Stream<MapData> getMapDataStream(GetMapDataStreamRef ref) {
  final location$ =
      ref.read(positionStreamProvider.future).asStream().asBroadcastStream();

  location$.debounceTime(const Duration(seconds: 5)).listen(
    (location) {
      ref.read(mapRepositoryProvider).updateUserLocation(
            latitude: location.longitude,
            longitude: location.latitude,
          );
    },
  );

  return location$.flatMap(
    (value) => ref
        .read(mapRepositoryProvider)
        .getMapData$(
          userLatitude: value.longitude,
          userLongitude: value.latitude,
        )

        /// TODO can map to differ location on meter so that markers would not overlap
        .map(
          (locations) => MapData(
            currentPosition: value,
            locations: locations,
          ),
        ),
  );
}

@riverpod
Future<bool> checkUserHasFriendInvite(
  CheckUserHasFriendInviteRef ref, {
  required String userId,
}) async =>
    await ref
        .read(socialRepositoryProvider)
        .getAnotherUserForInvite(userId: userId);

@riverpod
Future<bool> sendFriendInvite(
  SendFriendInviteRef ref, {
  required String userId,
}) async =>
    await ref.read(socialRepositoryProvider).sendFriendInvite(userId: userId);

@riverpod
Future<bool> joinJamFromMap(
  JoinJamFromMapRef ref, {
  required int jamId,
}) async =>
    await ref.read(jamRepositoryProvider).joinJam(jamId: jamId);
