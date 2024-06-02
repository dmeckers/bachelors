import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jam/config/config.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/globals.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState =
      ValueNotifier<AsyncValue<JUserAuthState>>(const AsyncLoading());
  var hasVibes = true;

  Future<dynamic> checkThirdPartyVibes() async {
    final tokenIssuer = supaAuth.currentUser?.userMetadata?['iss'] as String?;
    if (tokenIssuer == null) return;

    // TODO::// add more third party auth providers
    if (!tokenIssuer.contains('google')) return;

    final user = ref.read(storerProvider).get<UserProfileModel>();

    if (user == null) {
      return hasVibes =
          await ref.read(vibesRepositoryProvider).doesCurrentUserHaveVibes();
    }

    hasVibes = user.vibes.isNotEmpty;
  }

  ref
    ..onDispose(authState.dispose)
    ..listen(
      authStatChangesProvider.select(
        (value) => value.whenData((value) => value.authState),
      ),
      (_, next) async {
        await checkThirdPartyVibes();
        authState.value = next;
      },
    );

  final router = GoRouter(
    navigatorKey: ROUTER_KEY,
    refreshListenable: authState,
    debugLogDiagnostics: true,
    initialLocation: "/${GuestRoutes.splash.name}",
    //homeRoute is actual chat route with sub chat routes
    routes: [homeRoute, ...guestRoutes, ...utilityRoutes],
    errorBuilder: (_, state) => NotFoundPage(state: state),
    redirect: (context, state) async {
      final isLoading = authState.value.isLoading;
      final hasValue = authState.value.hasValue;
      final hasError = authState.value.hasError;

      if (hasError) {
        return "/${GuestRoutes.login.name}";
      }

      if (isLoading || (!hasValue && !hasError)) {
        return "/${GuestRoutes.splash.name}";
      }

      final authStateValue = authState.value.requireValue;

      final isGuestRoute = GuestRoutes.values
          .any((element) => element.name == state.uri.path.substring(1));

      final isSplash = state.uri.path == "/${GuestRoutes.splash.name}";

      if (authStateValue == JUserAuthState.authenticated && !hasVibes) {
        return "/${HomeRoutes.home.name}/${VibeRoutes.editMyVibes.name}";
      }

      return switch ((isGuestRoute, authStateValue, isSplash)) {
        (true, JUserAuthState.authenticated, false) =>
          "/${HomeRoutes.home.name}",
        (true, JUserAuthState.authenticated, true) =>
          "/${HomeRoutes.home.name}",
        (false, JUserAuthState.signedOut, false) =>
          "/${GuestRoutes.login.name}",
        (true, JUserAuthState.signedOut, true) => "/${GuestRoutes.login.name}",
        (true, JUserAuthState.passwordRecovery, false) =>
          "/${GuestRoutes.resetPassword.name}",
        _ => null,
      };
    },
    // extraCodec: const JamRouterCodec(),
  );

  ref.onDispose(router.dispose);

  return router;
}
