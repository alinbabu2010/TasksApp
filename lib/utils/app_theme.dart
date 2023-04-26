import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      colorScheme: ColorScheme.dark(
          primary: Colors.deepOrange.shade300,
          surface: Colors.deepOrange.shade300,
          onSurface: Colors.black87,
          background: const Color(0xFF212121),
          secondary: Colors.deepOrangeAccent.shade100,
          onSecondary: Colors.black87),
      dividerColor: Colors.grey.shade300,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        selectedItemColor: Colors.red.shade900,
        unselectedItemColor: Colors.black87,
      ),
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.red.shade900.withOpacity(0.1),
    ),
    AppTheme.lightTheme: ThemeData(
      colorScheme: const ColorScheme.light(
          primary: Colors.deepOrange,
          surface: Colors.deepOrange,
          onSurface: Colors.white,
          background: Color(0xFFE5E5E5),
          secondary: Colors.deepOrangeAccent,
          onSecondary: Colors.white),
      dividerColor: const Color(0xff757575),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.deepOrangeAccent,
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.white,
      ),
      // Code to add native ripple for BottomNavigationBar
      // Ref: https://github.com/flutter/flutter/issues/43515#issuecomment-612782673
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.yellowAccent.withOpacity(0.1),
    ),
  };
}
