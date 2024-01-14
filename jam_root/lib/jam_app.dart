import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/routing/routing.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

final _refreshKey = UniqueKey();
final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class JamApp extends StatelessWidget with ProfileRepositoryProviders {
  const JamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initalTheme: JamTheme.of(context),
      initialThemeMode: JamTheme.themeMode,
      child: Consumer(
        builder: (context, ref, child) {
          final router = ref.watch(routerProvider);

          ref.listen(
            connectivityStatusProvider,
            (_, connection) {
              ref.invalidate(currentUserProfileProvider);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: connection == ConnectionStatus.isConnected
                      ? const Text('Connected to internet')
                      : const Text('No internet connection'),
                ),
              );
            },
          );

          return MaterialApp.router(
            title: 'Jam',
            key: _refreshKey,
            themeMode: ThemeSwitcher.of(context).themeMode,
            darkTheme: ThemeSwitcher.of(context).themeData.darkTheme,
            theme: ThemeSwitcher.of(context).themeData.lightTheme,
            scaffoldMessengerKey: scaffoldKey,
            routerConfig: router,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}

// void _listenForInternetConnection(
//   WidgetRef ref,
//   GlobalKey<ScaffoldMessengerState> scaffoldKey,
//   BuildContext context,
// ) {

//   );
// }
