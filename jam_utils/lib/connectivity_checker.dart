import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef Connection = ConnectionStatus;

enum ConnectionStatus { notDetermined, isConnected, isDisconnected }

class ConnectivityStatusNotifier extends StateNotifier<ConnectionStatus> {
  ConnectionStatus? lastResult;
  ConnectionStatus? newState;

  ConnectivityStatusNotifier() : super(ConnectionStatus.isConnected) {
    lastResult = state;

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      newState = switch (result) {
        ConnectivityResult.ethernet ||
        ConnectivityResult.mobile ||
        ConnectivityResult.wifi ||
        ConnectivityResult.vpn =>
          ConnectionStatus.isConnected,
        ConnectivityResult.none => ConnectionStatus.isDisconnected,
        _ => ConnectionStatus.notDetermined
      };

      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}

final connectivityStatusProvider =
    StateNotifierProvider<ConnectivityStatusNotifier, ConnectionStatus>(
  (ref) => ConnectivityStatusNotifier(),
);

final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

isOnline(ProviderRef ref) async =>
    await ref.read(connectivityProvider).checkConnectivity() !=
    ConnectivityResult.none;
