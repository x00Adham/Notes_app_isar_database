import 'package:flutter/material.dart';
import 'package:notice_app_isar/themes/theme.dart';

class Themeprovider extends ChangeNotifier {
  //initializing the theme
  ThemeData _themeData = lightMode;
  //getter and setter for the theme
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;
  set themeData(ThemeData themData) {
    _themeData = themData;
    notifyListeners();
  }
  //toggle the theme
  void toggleTheme() {
    //if the theme is light mode then set it to dark mode and vice versa
    if (_themeData == lightMode) {
      themeData == darkMode;
    } else {
      themeData == lightMode;
    }
  }
}