import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/jams/jams.dart';
import 'package:jam/presentation/presentation.dart';

enum JamRoutes {
  details(),
  edit(),
  jams(),
  invites(),
  jamDetails(),
  jamDetailsParticipants(),
  jamControlParticipants(),
  jamQrPage(),
  jamScanQrPage(),
  jamEditVibes(),
  jamEditDetails(),
  editJamForm(),
  jamChat(),
  createNew();
}

final jamRoutes = GoRoute(
  path: JamRoutes.jams.name,
  name: JamRoutes.jams.name,
  builder: (_, state) => const JamPage(),
  routes: [
    GoRoute(
      path: JamRoutes.createNew.name,
      name: JamRoutes.createNew.name,
      builder: (_, state) => CreateJamPage(
        position: (state.extra as LatLng?),
      ),
    ),
    GoRoute(
      path: JamRoutes.invites.name,
      name: JamRoutes.invites.name,
      builder: (_, state) => JamInvitesPage(
        invites: (state.extra as JamInvites),
      ),
    ),
    GoRoute(
      path: ":jamId",
      name: JamRoutes.details.name,
      builder: (_, state) => JamDetailsPage(
        jamId: state.pathParameters['jamId']!,
      ),
      routes: [
        // GoRoute(
        //   path: JamRoutes.jamControlParticipants.name,
        //   name: JamRoutes.jamControlParticipants.name,
        //   builder: (_, state) => JamControlParticipantsPage(
        //     jamId: state.pathParameters['jamId']!,
        //   ),
        // ),

        GoRoute(
          path: JamRoutes.jamChat.name,
          name: JamRoutes.jamChat.name,
          builder: (_, state) => JamChatPage(
            jam: state.extra as JamModel,
          ),
        ),
        GoRoute(
          path: JamRoutes.jamDetailsParticipants.name,
          name: JamRoutes.jamDetailsParticipants.name,
          builder: (_, state) => JamParticipantsPage(
            jamId: state.pathParameters['jamId']!,
          ),
        ),
        GoRoute(
          path: JamRoutes.edit.name,
          name: JamRoutes.edit.name,
          builder: (_, state) => EditJamPage(jam: state.extra as JamModel),
          routes: [
            GoRoute(
              path: JamRoutes.jamEditDetails.name,
              name: JamRoutes.jamEditDetails.name,
              builder: (_, state) =>
                  EditJamDetailsPage(jam: state.extra as JamModel),
            ),
            GoRoute(
              path: JamRoutes.editJamForm.name,
              name: JamRoutes.editJamForm.name,
              builder: (_, state) => JamFormBuilderPage(
                jamModel: state.extra as JamModel,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
