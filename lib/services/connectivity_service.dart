import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectivityResult> _connectivityController =
      StreamController<ConnectivityResult>();

  Stream<ConnectivityResult> get connectivityStream =>
      _connectivityController.stream;

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityController.add(result);
    });
  }

  Future<ConnectivityResult> checkConnectivity() async {
    return await _connectivity.checkConnectivity();
  }

  void dispose() {
    _connectivityController.close();
  }
}
