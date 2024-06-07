import 'package:go_router/go_router.dart';

import 'package:jam/presentation/auth/auth.dart';
import 'package:jam/presentation/map/map.page.dart';
import 'package:jam/presentation/shared/shared.dart';

enum GuestRoutes { register, login, splash, forgotPassword, resetPassword }

final guestRoutes = [
  GoRoute(
    path: "/${GuestRoutes.register.name}",
    name: GuestRoutes.register.name,
    builder: (_, state) => const RegisterPage(),
  ),
  GoRoute(
    path: "/${GuestRoutes.login.name}",
    name: GuestRoutes.login.name,
    builder: (_, state) => const LoginPage(),
  ),
  GoRoute(
    path: "/${GuestRoutes.splash.name}",
    name: GuestRoutes.splash.name,
    builder: (_, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/${GuestRoutes.forgotPassword.name}",
    name: GuestRoutes.forgotPassword.name,
    builder: (_, state) => const MapPage(),
  ),
  GoRoute(
    path: "/${GuestRoutes.resetPassword.name}",
    name: GuestRoutes.resetPassword.name,
    builder: (_, state) => const ResetPasswordPage(),
  ),
];
