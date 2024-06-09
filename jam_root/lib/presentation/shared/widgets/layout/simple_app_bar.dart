import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jam/config/config.dart';
import 'package:jam_ui/jam_ui.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          title,
          style: context.jText.bodyMedium,
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(DEFAULT_APP_BAR_HEIGHT);
}

    // useEffect(() {
    //   final location = localDatabase.get('LOCATION');
    //   if (location != null) return () {};

    //   // TODO::QUICK FIX
    //   try {
    //     Location().getLocation().then(
    //           (location) => localDatabase.put(
    //             'LOCATION',
    //             'Lat: ${location.latitude}, Lng: ${location.longitude}',
    //           ),
    //         );
    //   } catch (e) {
    //     debugPrint(e.toString());
    //   }

    //   return () {};
    // }, []);