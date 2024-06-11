import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';

class PowerSyncVibesSerivce with SupabaseUserGetter {
  // Future<Vibes> getUserVibes() async {
  //   try {
  //     final vibes = await PowerSync.db.getAll(
  //       PowerSyncVibesQueries.GET_USER_VIBES,
  //       [getUserIdOrThrow()],
  //     );

  //     return vibes.map(PowerSyncRowParser.parseVibesFromPivot).toList();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     rethrow;
  //   }
  // }
}

final powersyncVibesServiceProvider = Provider(
  (ref) => PowerSyncVibesSerivce(),
);

// final getVibesProvider = FutureProvider<Vibes>(
//   (ref) => ref.watch(powersyncVibesServiceProvider).getUserVibes(),
// );
