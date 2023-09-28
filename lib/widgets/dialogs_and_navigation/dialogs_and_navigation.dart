import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/add_habit_screens/measurable_screen.dart';
import '../../screens/add_habit_screens/yes_or_no_screen.dart';
import '../custom_page_transition/custom_page_route_transition.dart';

class YesOrNoAlertDialog extends StatelessWidget {
  const YesOrNoAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class MeasureableAlertDialog extends StatelessWidget {
  const MeasureableAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
}

