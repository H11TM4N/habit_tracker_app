import 'package:flutter/material.dart';

class KthemeData {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade400,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade100,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade700,
      secondary: Colors.grey.shade400,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF79747E),
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
