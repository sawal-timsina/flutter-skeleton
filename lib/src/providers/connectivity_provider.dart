import 'package:connectivity_plus/connectivity_plus.dart'
    show Connectivity, ConnectivityResult;
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier;

import '../core/utils/constants.dart' show ConnectivityStatus;

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  late ConnectivityStatus lastResult;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.notDetermined) {
    lastResult = ConnectivityStatus.notDetermined;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      var newState = _mapConnectivityResultToStatus(result);
      if (newState != lastResult) {
        state = newState;
        lastResult = newState;
      }
    });
  }

  ConnectivityStatus _mapConnectivityResultToStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
      case ConnectivityResult.vpn:
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.other:
        return ConnectivityStatus.isConnected;
      case ConnectivityResult.none:
        return ConnectivityStatus.isDisconnected;
    }
  }
}
