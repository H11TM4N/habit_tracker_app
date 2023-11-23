import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: const Duration(milliseconds: 900),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
  ));
}

 DateFormat dateFormat() => DateFormat('EEE, MMM d');