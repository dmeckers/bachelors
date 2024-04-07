import 'package:go_router/go_router.dart';

import 'package:jam/presentation/presentation.dart';

enum WatchOtherUsersRoutes {
  otherUserProfilePage('userId');

  final String? pathParameter;

  const WatchOtherUsersRoutes(this.pathParameter);
}

final watchOtherUsersRoutes = [
  GoRoute(
    path: "user/:${WatchOtherUsersRoutes.otherUserProfilePage.pathParameter}",
    name: WatchOtherUsersRoutes.otherUserProfilePage.name,
    builder: (_, state) => OtherUserProfilePage(
      userId: state.pathParameters[
          WatchOtherUsersRoutes.otherUserProfilePage.pathParameter]!,
    ),
  ),
];
