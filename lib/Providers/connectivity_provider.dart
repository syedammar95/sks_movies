import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected => _isConnected;

  ConnectivityProvider() {
    _initializeConnectivity();
  }

  void _initializeConnectivity() {
    /// Listen for changes in network connectivity
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      /// Update the connectivity status based on the result
      if (results.isNotEmpty) {
        _isConnected = results.last != ConnectivityResult.none;
      } else {
        _isConnected = false;
      }
      notifyListeners();
    });
  }
}
