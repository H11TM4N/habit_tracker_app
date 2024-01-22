import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_tracker_app/models/habit.dart';

class HabitsHeatMap extends StatelessWidget {
  final Habit habit;
  const HabitsHeatMap({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    List<DateTime> completedDates() {
      final List<DateTime> result = [];

      for (var entry in habit.completionStatus.entries) {
        if (entry.value) {
          result.add(entry.key);
        }
      }
      return result;
    }

    final Map<DateTime, int> datasets = {
      for (var date in completedDates()) date: 9
    };

    return SizedBox(
      height: 400,
      child: HeatMapCalendar(
        defaultColor: Colors.white.withOpacity(0.1),
        flexible: true,
        showColorTip: false,
        colorMode: ColorMode.color,
        datasets: datasets,
        colorsets: const {
          9: Colors.greenAccent,
        },
      ),
    );
  }
}
