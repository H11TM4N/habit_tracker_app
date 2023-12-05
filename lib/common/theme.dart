import 'package:flutter/material.dart';

class KthemeData {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF406882),
        primary: Color(0xFF1A374D),
        secondary: Color(0xFF6998AB),
        tertiary: Color(0xFF748DA6)),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF79747E),
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
