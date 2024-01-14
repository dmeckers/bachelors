import 'dart:async';

import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
// ignore: depend_on_referenced_packages
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

/// Initializes map renderer to the `latest` renderer type.
/// The renderer must be requested before creating GoogleMap instances,
/// as the renderer can be initialized only once per application context.

class GMService {
  static Completer<AndroidMapRenderer?>? _initializedRendererCompleter;
  static Future<AndroidMapRenderer?> initializeMapRenderer() async {
    if (_initializedRendererCompleter != null) {
      return _initializedRendererCompleter?.future;
    }

    final Completer<AndroidMapRenderer?> completer =
        Completer<AndroidMapRenderer?>();
    _initializedRendererCompleter = completer;

    final GoogleMapsFlutterPlatform platform =
        GoogleMapsFlutterPlatform.instance;
    unawaited((platform as GoogleMapsFlutterAndroid)
        .initializeWithRenderer(AndroidMapRenderer.latest)
        .then((AndroidMapRenderer initializedRenderer) =>
            completer.complete(initializedRenderer)));

    return completer.future;
  }
}
