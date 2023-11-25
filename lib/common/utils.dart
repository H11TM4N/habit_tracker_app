import 'package:flutter/material.dart';
import 'package:habit_tracker_app/ui/widgets/widgets.dart';
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

void slideUpPageTransition({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.push(context, BottomToTopPageTransition(route: page));
}

void smoothTransition({
  required BuildContext context,
  required Widget page,
}) {
  Navigator.push(context, MyCustomRouteTransition(route: page));
}
