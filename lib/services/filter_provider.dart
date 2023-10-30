import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  List _selectedFilters = [];
  String _error = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String get error => _error;

  List get selectedFilters => _selectedFilters;

  Future<void> setLoading(bool status) async {
    _isLoading = status;
    // notifyListeners();
  }

  Future<void> addToFilter(value) async {
    _error = '';
    // notifyListeners();
    try {
      _selectedFilters.add(value);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> removeFilter(value) async {
    _error = '';
    // notifyListeners();
    try {
      _selectedFilters.remove(value);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
