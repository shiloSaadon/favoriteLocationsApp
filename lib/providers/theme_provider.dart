import 'package:flutter/material.dart';
import 'package:nav_app_4_host/ui/themes/dark_theame.dart';
import 'package:nav_app_4_host/ui/themes/light_theme.dart';
import 'package:nav_app_4_host/utils/genral_utils.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  static final ThemeProvider _singleton = ThemeProvider._internal();

  ThemeProvider._internal();

  factory ThemeProvider() {
    ThemeProvider object = _singleton;
    return object;
  }

  void changeTheme() {
    if (currentTheme == lightTheme) {
      currentTheme = darkTheme;
    } else {
      currentTheme = lightTheme;
    }
    overLaysHandling();
    updateState();
  }

  void updateState() => notifyListeners();
}
