import 'package:flutter/material.dart';
import 'package:habit_tracker_app/UI/screens/create_habit_screen.dart';
import 'package:habit_tracker_app/common/common.dart';

class FabView extends StatelessWidget {
  const FabView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onPressed: () {
        bottomToTopNavigation(context, const CreateHabitScreen());
      },
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        weight: 20,
      ),
    );
  }
}
