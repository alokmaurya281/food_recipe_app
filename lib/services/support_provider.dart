import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/config/api_urls.dart';
import 'package:http/http.dart' as http;

class SupportProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _error = '';
  String get error => _error;

  Map<String, dynamic> _support = {};
  Map<String, dynamic> get support => _support;

  Future<void> setLoading(bool status) async {
    _isLoading = status;
    notifyListeners();
  }

  // report send
  Future<void> sendSupport(
      String token, String name, String email, String problem) async {
    _error = '';
    // _isLoading = true;
    // notifyListeners();
    try {
      final response = await http.post(
        Uri.parse(sendSupportUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'email': email,
          'name': name,
          'problem': problem,
        }),
      );

      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 201) {
        _support = data['data'];
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
