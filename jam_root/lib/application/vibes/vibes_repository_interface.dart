import 'package:jam/domain/domain.dart';

abstract class VibesRepositoryInterface {
  Future<List<VibeModel>> searchVibesAI({required String query});
  Future<List<VibeModel>> searchVibes({required String query});
  Future<List<VibeModel>> getVibesByUserId({required String userId});
  Future<void> updateVibes({required List<VibeModel> vibes});
  Future<bool> doesCurrentUserHaveVibes();

  Future<List<VibeModel>> getVibeSuperCategories();
}
