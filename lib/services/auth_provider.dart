import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/config/api_urls.dart';
import 'package:food_recipe_app/models/user.dart';
import 'package:food_recipe_app/services/connectivity_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  late final SharedPreferences sharedPreferences;

  dynamic _user;
  String _error = '';
  String _otp = '';
  String get otp => _otp;

  String get error => _error;

  dynamic get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isValid = false;
  bool get isValid => _isValid;

  bool _socialSigninLoading = false;
  bool get socialSigninLoading => _socialSigninLoading;

  bool _isLoggedIn = false;
  String _accessToken = '';
  bool get isLoggedIn => _isLoggedIn;

  String get accessToken => _accessToken;

  Future<void> setLoading(bool status) async {
    _isLoading = status;
    notifyListeners();
  }

  Future<void> setSocialLoading(bool status) async {
    _socialSigninLoading = status;
    notifyListeners();
  }

  // signup
  Future<void> signup(
      String email, String password, String username, String name) async {
    _error = '';
    // _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
          "name": name
        }),
      );

      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 201) {
        _user = User.fromJson(data['data']);
        // _isLoading = false;
        sendOTP(email);
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

  // send otp

  Future<void> sendOTP(String email) async {
    _error = '';
    // _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse(sendotpUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
        }),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 201) {
        // _isLoading = false;
        _otp = data['data']['otp'];
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

  // verify otp

  Future<bool> verifyOTP(otp, email) async {
    _error = '';
    bool _isVerified = false;
    try {
      final response = await http.post(
        Uri.parse(verifyOtpUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "otp": otp,
        }),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        _isVerified = true;
        notifyListeners();
      } else {
        _error = data['message'];
        // _isLoading = false;
        _isVerified = false;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      // _isLoading = false;
      _isVerified = false;
      notifyListeners();
    }
    return _isVerified;
  }

  // For Login authentication

  Future<void> login(String email, String password) async {
    _error = '';
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        await setToken(true, data['accessToken']);
        await getToken();
        _isLoggedIn = true;
        _accessToken = data['accessToken'];
        notifyListeners();
      } else {
        _error = data['message'];
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  //for set the token

  Future<void> setToken(bool isLoggedIn, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
    await prefs.setString('accessToken', token);
  }

  // get token

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = await prefs.getBool('isLoggedIn') ?? false;
    _accessToken = await prefs.getString('accessToken') ?? '';
    notifyListeners();
  }

  // forgotpass

  Future<void> forgotPassword(String email) async {
    _error = '';
    // _isLoading = true;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse(forgotPassUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
        }),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 201) {
        // _isLoading = false;
        _otp = data['data']['otp'];
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

  // forgot pass account verification
  Future<bool> accountVerify(otp, email) async {
    _error = '';
    bool _isVerified = false;
    try {
      final response = await http.post(
        Uri.parse(accountVerifyUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "otp": otp,
        }),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        _isVerified = true;
        notifyListeners();
      } else {
        _error = data['message'];
        // _isLoading = false;
        _isVerified = false;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      // _isLoading = false;
      _isVerified = false;
      notifyListeners();
    }
    return _isVerified;
  }

  // reset pass
  Future<bool> resetPassword(email, password) async {
    _error = '';
    bool _isChanged = false;
    try {
      final response = await http.post(
        Uri.parse(resetpassUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        _isChanged = true;
        notifyListeners();
      } else {
        _error = data['message'];
        _isChanged = false;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      // _isLoading = false;
      _isChanged = false;
      notifyListeners();
    }
    return _isChanged;
  }

  // signout

  Future<void> signout() async {
    await setToken(false, '');
    await getToken();
  }

  Future<void> signInWithGoogle(type) async {
    _error = '';
    try {
      _user = await _googleSignIn.signIn();
      notifyListeners();
      if (_user != null) {
        await socialSignin(type, _user.email, _user.displayName, _user.id);
      } else {
        _error = 'Plaese Select account to login';
        notifyListeners();
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    _user = null;
    notifyListeners();
  }

  // social signin

  Future<void> socialSignin(type, email, name, socialId) async {
    _error = '';

    try {
      final response = await http.post(
        Uri.parse(socialLoginUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "name": name,
          "type": type,
          "socialId": socialId,
        }),
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        await setToken(true, data['data']['accessToken']);
        await getToken();
        _isLoggedIn = true;
        _accessToken = data['data']['accessToken'];
        notifyListeners();
      } else {
        _error = data['message'];
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<bool> isTokenValid(token) async {
    _isValid = false;
    _error = '';
    try {
      final response = await http.get(
        Uri.parse(profileUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken'
        },
      );

      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        _user = data['data'];
        _isValid = _user == null ? false : true;
        notifyListeners();
      }
      if (!_isValid) {
        _error = 'Unauthorized';
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      // _isLoading = false;
      notifyListeners();
    }
    return _isValid;
  }

  Future<void> initialize() async {
    await getToken();
    await isTokenValid(_accessToken);
    await ConnectivityProvider().checkConnectivity();
  }
}
