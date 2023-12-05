import 'package:flutter/material.dart';

class KthemeData {
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
