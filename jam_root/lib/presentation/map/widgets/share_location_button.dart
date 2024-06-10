import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:location/location.dart';

class ShareLocationButton extends HookConsumerWidget {
  const ShareLocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arePermissionDisabled = useState(false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (arePermissionDisabled.value)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 27.0, horizontal: 20),
            child: Text(
              textAlign: TextAlign.center,
              ' Location permission denied forever - please open app settings',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: arePermissionDisabled.value ? Colors.grey : null,
          ),
          onPressed: () async {
            if (arePermissionDisabled.value) return;

            try {
              final location = await Location().getLocation();

              ref.read(mapWidgetStateControllerProvider).setUserCurrentLocation(
                    LatLng(
                      location.latitude ?? 0,
                      location.longitude ?? 0,
                    ),
                  );
            } catch (e) {
              arePermissionDisabled.value = true;
            }
          },
          child: Text(
            'Share location',
            style: TextStyle(
              color: arePermissionDisabled.value ? Colors.black : null,
            ),
          ),
        ),
      ],
    );
  }
}
