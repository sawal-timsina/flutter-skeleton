import 'package:connectivity_plus/connectivity_plus.dart'
    show Connectivity, ConnectivityResult;
import 'package:flutter/material.dart';

import '../core/enums/enums.dart';

class ConnectivityStatusNotifier with ChangeNotifier {
  late ConnectivityStatus _status;

  ConnectivityStatusNotifier() {
    _status = ConnectivityStatus.initial;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      final newState = _mapConnectivityResultToStatus(result);
      _status = newState;
      notifyListeners();
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

  ConnectivityStatus get status => _status;
}
