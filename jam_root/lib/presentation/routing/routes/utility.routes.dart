import 'package:go_router/go_router.dart';
import 'package:jam/presentation/presentation.dart';

enum UtilityRoutes { chooseVibes }

final utilityRoutes = [
  GoRoute(
    path: "/${UtilityRoutes.chooseVibes.name}",
    name: UtilityRoutes.chooseVibes.name,
    builder: (_, __) => const ChooseVibesPage(),
  ),
];
