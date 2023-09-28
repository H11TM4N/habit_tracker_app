import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/measurable_screen.dart';

import '../screens/yes_or_no_screen.dart';
import '../widgets/custom_page_transition/custom_page_route_transition.dart';

Widget yesOrNoAlertDialog(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MyCustomRouteTransition(route: const YesOrNoScreen()),
      );
    },
    child: const AlertDialog(
      title: Text('Yes or No'),
      content: Text('e.g. Did you wake up early today?'),
    ),
  );
}

Widget measureableAlertDialog(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MyCustomRouteTransition(route: const MeasurableScreen()),
      );
    },
    child: const AlertDialog(
      title: Text('Measurable'),
      content: Text('e.g. How many miles did you run today?'),
    ),
  );
}
