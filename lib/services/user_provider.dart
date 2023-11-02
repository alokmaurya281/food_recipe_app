import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/config/api_urls.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic> _user = {};
  Map<String, dynamic> get user => _user;

  String _error = '';
  String get error => _error;

  // set loading

  Future<void> setLoading(bool status) async {
    _isLoading = status;
    // notifyListeners();
  }

  // user profile
  Future<void> userProfileByEmail(String token) async {
    _error = '';
    // _isLoading = true;
    // notifyListeners();
    try {
      final response = await http.get(
        Uri.parse(userProfileByEmailUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        _user = data['data'];
        notifyListeners();
      } else {
        _error = data['message'];
        // _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      // _isLoading = false;
      notifyListeners();
    }
  }

  // user profile
  Future<void> updateUserProfile(
      String token, Map<String, dynamic> fields) async {
    _error = '';
    // _isLoading = true;
    // notifyListeners();
    try {
      final response = await http.put(
        Uri.parse(updateeProfileUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(fields),
      );

      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        _error = data['message'];
        // _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      // _isLoading = false;
      notifyListeners();
    }
  }
}
