import 'package:jam/application/application.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/data/data.dart';

part 'map_controller.g.dart';

final locatorServiceProvider = Provider<Location>((ref) => Location());
final currentLocationStreamProvider = StreamProvider(
  (ref) =>
      ref.read(locatorServiceProvider).onLocationChanged.asBroadcastStream(),
);

@riverpod
Future<UserWithRelationshipStatus> checkRelationShipStatus(
  CheckRelationShipStatusRef ref, {
  required String userId,
}) async =>
    await ref
        .read(socialRepositoryProvider)
        .getRelationshipStatus(userId: userId);

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
