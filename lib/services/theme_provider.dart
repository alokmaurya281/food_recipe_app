import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setTheme(theme) {
    _themeMode = theme;
    notifyListeners();
  }
}
