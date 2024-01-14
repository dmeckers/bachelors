import 'package:jam/config/config.dart';

mixin SupabaseUserGetter {
  static const GET_USER_FRIENDS = 'get_user_friends';

  String getUserIdOrThrow() {
    final userId = supabase.auth.currentUser?.id;

    if (userId == null) {
      throw Exception('User id lost');
    }

    return userId;
  }

  static String getOrThrow() {
    final userId = supabase.auth.currentUser?.id;

    if (userId == null) {
      throw Exception('User id lost');
    }

    return userId;
  }
}
