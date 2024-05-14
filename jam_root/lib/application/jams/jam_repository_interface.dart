import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

abstract class JamRepositoryInterface {
  Future<JamModel> getJam({required int jamId});
  Future<JamModel> createJam(JamModel jam);
  Future<JamModel> updateJamDetails(JamModel jam);
  Future<JamModel> updateJamVibes(JamModel jam);
  Future<void> deleteJam({required int jamId});
  Future<List<JamModel>> getActiveOwnerJams({required String userId});
  Future<List<JamModel>> getParticipatedOutdatedJamsByUserId({
    required String userId,
  });
  Future<List<JamModel>> getActiveParticipatedJamsByUserId({
    required String userId,
  });
  Future<bool> joinJam({required int jamId});

  Future<List<UserProfileModel>> getJamParticipants({required int jamId});

  Future<List<BaseJamFormModel>> getJamJoinRequests({
    required int jamId,
  });

  Future<void> acceptJoinRequest({
    required int jamId,
    required int joinRequestId,
    required String userId,
  });

  Future<void> rejectJoinRequest({
    required int jamId,
    required int joinRequestId,
    required String userId,
  });

  Future<void> freezeRequest({
    required int jamId,
    required int joinRequestId,
    required String userId,
  });

  Future<void> unfreezeRequest({
    required int jamId,
    required int joinRequestId,
    required String userId,
  });

  // abstract final JamFormsServiceInterface formsService;
  abstract final JamQueueInterface queue;
  abstract final AttachmentServiceInterface attachmentService;
}
