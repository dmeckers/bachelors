import 'package:jam/domain/domain.dart';

abstract class JamQueueInterface {
  Future<JamModel> queueCreate(JamModel jam);
  Future<JamModel> queueUpdateDetails(JamModel jam);
  Future<JamModel> queueUpdateVibes(JamModel jam);
  Future<void> queueDelete({required int jamId});
  Future<bool> queueJoin({required int jamId});
}
