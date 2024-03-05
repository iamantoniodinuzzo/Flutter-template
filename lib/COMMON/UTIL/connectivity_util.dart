import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

//TODO: Singleton? deve avere un metodo statico da poter chiamare
// per controllare se è presente la connessione
class ConnectivityUtil {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Callback function to handle connection status updates
  late void Function(ConnectivityResult) onConnectionStatusChanged;

  ConnectivityUtil({required this.onConnectionStatusChanged}) {
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    onConnectionStatusChanged(result);
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(onConnectionStatusChanged);
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }

  Future<ConnectivityResult> checkConnectivity() async {
    return await _connectivity.checkConnectivity();
  }
}
