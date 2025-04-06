import 'package:flutter/material.dart';

//light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade400,
    surface: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade800,
  ),
);

//dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
  ),
);
