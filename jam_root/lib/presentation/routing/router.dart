import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jam/config/config.dart';

import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(RouterRef ref) {
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  var hasVibes = true;

  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authStatChangesProvider.select(
        (value) => value.whenData((value) => value.isAuthenticated),
      ),
      (_, next) async {
        final iss = supaAuth.currentUser?.userMetadata?['iss'] as String?;
        if (iss?.contains('google') ?? false) {
          final cached = localDatabase.get('hasVibes');

          if (cached != null) {
            hasVibes = cached;
          } else {
            hasVibes = await ref
                .read(vibesRepositoryProvider)
                .doesCurrentUserHaveVibes();
          }
        }

        isAuth.value = next;
      },
    );

  final router = GoRouter(
    navigatorKey: routerKey,
    refreshListenable: isAuth,
    debugLogDiagnostics: true,
    initialLocation: "/${GuestRoutes.splash.name}",
    //homeRoute is actual chat route with sub chat routes
    routes: [homeRoute, ...guestRoutes, ...utilityRoutes],
    errorBuilder: (_, state) => NotFoundPage(state: state),
    redirect: (context, state) async {
      if (isAuth.value.unwrapPrevious().hasError) {
        return "/${GuestRoutes.login.name}";
      }

      if (isAuth.value.isLoading ||
          (!isAuth.value.hasValue && !isAuth.value.hasError)) {
        return "/${GuestRoutes.splash.name}";
      }

      final isGuestRoute = GuestRoutes.values
          .any((element) => element.name == state.uri.path.substring(1));
      final isAuthenticated = isAuth.value.requireValue;
      final isSplash = state.uri.path == "/${GuestRoutes.splash.name}";

      if (isAuthenticated && !hasVibes) {
        return "/${HomeRoutes.home.name}/${VibeRoutes.editMyVibes.name}";
      }

      return switch ((isGuestRoute, isAuthenticated, isSplash)) {
        (true, true, false) => "/${HomeRoutes.home.name}",
        (true, true, true) => "/${HomeRoutes.home.name}",
        (false, false, false) => "/${GuestRoutes.login.name}",
        (true, false, true) => "/${GuestRoutes.login.name}",
        _ => null,
      };
    },
    // extraCodec: const JamRouterCodec(),
  );

  ref.onDispose(router.dispose);

  return router;
}
