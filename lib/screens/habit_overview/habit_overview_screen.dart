import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/habit_overview_widgets/habit_calender.dart';

class HabitOverviewScreen extends StatelessWidget {
  final String habitName;
  const HabitOverviewScreen({
    super.key,
    required this.habitName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(habitName),
      ),
      body: const Column(
        children: [
          HabitCalender(),
        ],
      ),
    );
  }
}
