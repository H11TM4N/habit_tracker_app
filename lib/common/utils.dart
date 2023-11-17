import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: const Duration(milliseconds: 900),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
  ));
}
