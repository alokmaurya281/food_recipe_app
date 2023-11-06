import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  var _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setTheme(theme) async {
    int themeI = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == ThemeMode.system) {
      themeI = 1;
    } else if (theme == ThemeMode.light) {
      themeI = 2;
    } else {
      themeI = 3;
    }
    await prefs.setInt('ThemeMode', themeI);
    await getTheme();
  }

  Future<void> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int theme = await prefs.getInt('ThemeMode') as int;
    if (theme == 1) {
      _themeMode = ThemeMode.system;
    } else if (theme == 2) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
