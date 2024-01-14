import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/firebase_options.dart';
import 'package:jam/jam_app.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:jam_utils/jam_utils.dart';

import 'data/data.dart';
import 'presentation/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  await JamTheme.initialize();

  // Initialize local database
  await HiveService.initialize();
  // await GMService.initializeMapRenderer();

  await Supabase.initialize(
    url: dotenv.env[EnvironmentConstants.SUPABASE_PROJECT_URL]!,
    anonKey: dotenv.env[EnvironmentConstants.SUPABASE_API_KEY]!,
  );

  /// 1. auth hooks
  /// 1.1 on login
  ///  a)store data in local db
  ///  b)update online status
  ///  c)initialize fcm token listener
  /// 1.2 on logout
  ///   a)clear local db
  ///   b) update online status
  await SupabaseServices.initialize();
  await BugSnagService.initialize();
  await JamMarker.initializeMarkers();

  if (Platform.isAndroid) {
    await AndroidNotificator.init();
  }

  runApp(const ProviderScope(observers: [StateLogger()], child: JamApp()));
}
