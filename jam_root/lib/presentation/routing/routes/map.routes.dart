import 'package:go_router/go_router.dart';
import 'package:jam/presentation/map/map.page.dart';

import 'package:jam/presentation/presentation.dart';

enum MapRoutes {
  map('coords');

  final String? pathParameter;

  const MapRoutes(this.pathParameter);
}

final mapRoute = GoRoute(
  path: MapRoutes.map.name,
  name: MapRoutes.map.name,
  builder: (_, state) => const MapPage(),
);
