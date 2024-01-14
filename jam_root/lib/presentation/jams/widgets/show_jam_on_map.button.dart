import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class ShowJamOnMapButton extends StatelessWidget {
  const ShowJamOnMapButton({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: () => context.pushNamed(
          MapRoutes.map.name,
          queryParameters: {MapRoutes.map.pathParameter!: jam.location},
        ),
        child: const Row(
          children: [
            Icon(Icons.map),
            SizedBox(width: 30),
            Text('Open in Maps'),
          ],
        ),
      ),
    );
  }
}
