import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam_utils/jam_utils.dart';

final class SupabaseVibesRepository extends VibesRepositoryInterface
    with SupabaseUserGetter, Storer {
  static const SEARCH_RPC = 'search_vibes_by_name';
  static const UPDATE_RPC = 'update_user_vibes';

  SupabaseVibesRepository(this._ref);

  final ProviderRef _ref;

  @override
  Future<Vibes> searchVibesAI({required String query}) async {
    final embeddingResponse = await supabase.functions.invoke(
      'search_similliar_vibes_by_embeddings',
      body: {'query': query},
    );

    final vibesResponse = (await supabase.rpc("match_vibes", params: {
      'query_embedding': embeddingResponse.data,
      'match_threshold': 0.825,
      'match_count': 10,
    }) as Dynamics);

    return vibesResponse
        .map(
          (e) => VibeModel.fromJson(e),
        )
        .cast<VibeModel>()
        .toList();
  }

  @override
  Future<Vibes> getVibesByUserId({required String userId}) async {
    final result = await supabase
        .from('users_vibes')
        .select("id ,vibes( id, name, icon_url)")
        .eq('user_id', userId);

    final vibes = result.map((e) => e['vibes']).toList();

    return vibes.map((e) => VibeModel.fromJson(e)).toList();
  }

  @override
  Future<Vibes> searchVibes({required String query}) async {
    try {
      return await supabase
          .from('vibes')
          .select()
          .textSearch('search_vector', query, type: TextSearchType.websearch)
          .withConverter<Vibes>(
            (data) => data.map((e) => VibeModel.fromJson(e)).toList(),
          );
    } catch (e) {
      return [];
    }
  }

  void fetchAndCacheDataInBackground() {
    final location = _ref.read(locationServiceProvider);
    final mapRepo = _ref.read(mapRepositoryProvider);

    mapRepo.getUserAndJamsLocations().then((mapPoints) async {
      final locationData = await location.getLocation();
      final locationLatLng =
          LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0);

      final mapData = MapData(
        currentPosition: locationLatLng,
        locations: [...mapPoints.jams, ...mapPoints.users],
      );

      hivePut<MapData>(mapData).then((_) => debugPrint('Map data cached'));
    });
  }

  @override
  Future<void> updateVibes({required List<VibeModel> vibes}) async {
    final userId = getUserIdOrThrow();

    // if (!(await isOnline(_ref))) {
    //   await PowerSync.db.execute(
    //     'DELETE FROM users_vibes WHERE user_id = ?',
    //     [userId],
    //   );

    //   await PowerSync.db.executeBatch(
    //     'INSERT INTO users_vibes (id , user_id, vibe_id) VALUES (? , ?, ?)',
    //     vibes.map((e) => [const Uuid().v4(), userId, e.id]).toList(),
    //   );
    // }
    final updateVibePayload = {
      'user_id': userId,
      'vibe_ids': [...vibes.map((e) => e.id)]
    };

    await supabase.rpc(UPDATE_RPC, params: updateVibePayload);

    final cached = hiveGet<UserProfileModel>();

    cached.isNotNull && await hiveRefresh(cached!.copyWith(vibes: vibes));

    fetchAndCacheDataInBackground();
  }

  @override
  Future<bool> doesCurrentUserHaveVibes() async {
    if (supabase.auth.currentUser == null) return false;

    // if (!(await isOnline(_ref))) {
    //   final row = await PowerSync.db.get(
    //       'SELECT id FROM users_vibes WHERE user_id = ?', []);
    //   return row.isNotEmpty;
    // }

    final record = await supabase
        .from('users_vibes')
        .select()
        .eq('user_id', getUserIdOrThrow());

    return record.isNotEmpty;
  }

  @override
  Future<List<VibeModel>> getVibeSuperCategories() async {
    final response = await supabase.rpc('get_vibe_super_categories');

    return (response as Dynamics).cast<Json>().map(VibeModel.fromJson).toList();
  }
}

final vibesRepositoryProvider = Provider<VibesRepositoryInterface>(
  (ref) => SupabaseVibesRepository(ref),
);
