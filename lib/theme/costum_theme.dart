import 'package:flutter/material.dart';

final Color colorsTheme = Colors.lightGreen;

ThemeData costumeTheme() {
  return ThemeData(
    primaryColor: colorsTheme,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: colorsTheme),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.black45,
      selectedItemColor: colorsTheme,
    ),
  );
}
