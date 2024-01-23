import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HabitsBarChart extends ConsumerWidget {
  const HabitsBarChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitProvider);

    // final ha = habits.where((habit) => habit.completionStatus.,)

    return HeatMapCalendar(
      datasets: {
        DateTime(2021, 1, 6): 1,
        DateTime(2021, 1, 7): 2,
        DateTime(2021, 1, 8): 3,
        DateTime(2021, 1, 9): 4,
        DateTime(2021, 1, 13): 5,
      },
      colorMode: ColorMode.opacity,
      colorsets: {
        1: Colors.green.shade100,
        2: Colors.green.shade200,
        3: Colors.green.shade300,
        4: Colors.green.shade400,
        5: Colors.green.shade500,
        6: Colors.green.shade600,
        7: Colors.green.shade700,
        8: Colors.green.shade800,
        9: Colors.green.shade900,
        10: const Color(0xff294B29),
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
