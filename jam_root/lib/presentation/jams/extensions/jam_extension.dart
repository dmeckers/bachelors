import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

extension JamExtension on JamModel {
  bool get isOwner => creatorId! == supabase.auth.currentUser!.id;
}
