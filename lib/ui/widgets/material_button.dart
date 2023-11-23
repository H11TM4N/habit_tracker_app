import 'package:flutter/material.dart';

Widget kMaterialButton(VoidCallback onPressed ,String text) {
  return MaterialButton(
      minWidth: 140,
      elevation: 40,
      onPressed: onPressed,
      child: Text(text));
}
