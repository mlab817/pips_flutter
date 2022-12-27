import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/foundation.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementer implements NetworkInfo {
  final DataConnectionChecker _dataConnectionChecker;

  NetworkInfoImplementer(this._dataConnectionChecker);

  @override
  Future<bool> get isConnected => _getIsConnected();

  _getIsConnected() {
    if (kIsWeb) {
      return true;
    } else {
      return _dataConnectionChecker.hasConnection;
    }
  }
}
