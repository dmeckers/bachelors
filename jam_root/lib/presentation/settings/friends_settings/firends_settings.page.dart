import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/shared/shared.dart';

class FriendsSettingsPage extends HookConsumerWidget {
  const FriendsSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final friends

    return const Scaffold(
        appBar: SimpleAppBar(title: 'Friends settings'),
        body: Center(
          child: Text('Friends settings'),
        ));
  }
}
