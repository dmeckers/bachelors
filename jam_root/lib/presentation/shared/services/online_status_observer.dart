import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';

class OnlineStatusObserver extends WidgetsBindingObserver
    with ProfileRepositoryProviders {
  final UserProfileRepositoryInterface userProfileSettingsRepo;

  OnlineStatusObserver({required this.userProfileSettingsRepo});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      userProfileSettingsRepo.updateOnlineStatus(onlineStatus: true);
      return;
    }

    userProfileSettingsRepo.updateOnlineStatus(onlineStatus: false);
  }
}

final onlineStatusObserverProvider = Provider<OnlineStatusObserver>((ref) {
  final profileSettingsProviders = ref.read(profileRepositoryProvidersProvider);
  final userProfileSettingsRepo =
      ref.read(profileSettingsProviders.userProfileRepository);
  return OnlineStatusObserver(userProfileSettingsRepo: userProfileSettingsRepo);
});
