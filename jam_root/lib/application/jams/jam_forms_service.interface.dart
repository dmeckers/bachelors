import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

abstract class JamFormsServiceInterface {
  Future updateJamForm({
    required int jamId,
    required BaseJamFormModel form,
  });

  Future<BaseJamFormModel> getJamForm({required int jamId});

  Future<void> submitFormAndSendRequest({
    required int jamId,
    required String? creatorFcmToken,
    required BaseJamFormModel form,
  });

  Future<void> submitFormAndJoin({
    required int jamId,
    required String? creatorFcmToken,
    required BaseJamFormModel form,
  });

  Future<void> sendRequestForJoin({
    required int jamId,
  });

  Future<bool> hasUserFilledForm({
    required int jamId,
  });

  abstract final JamRepositoryInterface repo;
}
