import 'dart:io';

import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool _internetConnected = true;
  bool get internetConnected => _internetConnected;

  Future<void> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _internetConnected = true;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _internetConnected = false;
      notifyListeners();
    }
  }
}
