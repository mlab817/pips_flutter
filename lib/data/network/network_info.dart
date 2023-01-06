import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final Connectivity _dataConnectionChecker;

  NetworkInfoImplementer(this._dataConnectionChecker);

  @override
  Future<bool> get isConnected => _getIsConnected();

  Future<bool> _getIsConnected() async {
    final ConnectivityResult connectivityResult =
    await _dataConnectionChecker.checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
