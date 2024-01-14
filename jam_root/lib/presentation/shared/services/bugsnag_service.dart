import 'dart:isolate';

import 'package:bugsnag_flutter/bugsnag_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jam/config/config.dart';

class BugSnagService {
  static Future<void> initialize() async {
    await bugsnag.start(
      apiKey: dotenv.env[EnvironmentConstants.BUGSNAG_API_KEY]!,
    );

    ///
    /// Report errors from Flutter framework
    ///
    FlutterError.onError = (FlutterErrorDetails details) {
      if (kDebugMode) {
        print(details);
      }

      if (kReleaseMode) {
        bugsnag.notify(details.exception, details.stack);
      }
    };

    ///
    /// Report errors from Dart's isolate (background process)
    ///
    Isolate.current.addErrorListener(
      RawReceivePort((pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        if (kDebugMode) {
          print('Caught error in isolate: ${errorAndStacktrace[0]}');
        }

        if (kReleaseMode) {
          bugsnag.notify(errorAndStacktrace[0], errorAndStacktrace[1]);
        }
      }).sendPort,
    );
  }
}
