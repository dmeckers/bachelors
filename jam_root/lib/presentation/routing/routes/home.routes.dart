import 'package:go_router/go_router.dart';

import 'package:jam/presentation/presentation.dart';

enum HomeRoutes {
  home;
}

final homeRoute = GoRoute(
  path: "/${HomeRoutes.home.name}",
  name: HomeRoutes.home.name,
  builder: (_, state) => const ChatsPage(),
  routes: [
    settingsRoutes,
    jamRoutes,
    mapRoute,
    ...chatsRoutes,
    ...watchOtherUsersRoutes,
  ],
);
