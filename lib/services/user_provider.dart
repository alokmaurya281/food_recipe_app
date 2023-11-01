import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // set loading

  Future<void> setLoading(bool status) async {
    _isLoading = status;
    notifyListeners();
  }

  


}
