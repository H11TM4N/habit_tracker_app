import 'package:flutter/material.dart';

class KthemeData {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF79747E),
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
