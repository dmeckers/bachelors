import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

final gHasCurrentUserVibes = StateProvider<bool>((ref) {
  final user = ref.read(storerProvider).get<UserProfileModel>();

  if (user == null) {
    return false;
  }

  return user.vibes.isNotEmpty;
});
