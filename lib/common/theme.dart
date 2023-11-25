import 'package:flutter/material.dart';

class KthemeData {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      background: Color(0xFFC4DFDF),
      primary: Color(0xFFD2E9E9),
      secondary: Color(0xFFE3F4F4),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF404258),
      primary: Color(0xFF474E68),
      secondary: Color(0xFF6B728E),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF79747E),
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
