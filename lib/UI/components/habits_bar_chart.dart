import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HabitsBarChart extends ConsumerWidget {
  const HabitsBarChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitProvider);
    final Map<String, int> habitsCountByDay = {
      'Mon': 0,
      'Tue': 0,
      'Wed': 0,
      'Thu': 0,
      'Fri': 0,
      'Sat': 0,
      'Sun': 0,
    };

    // Compute the completion count for each day
    for (final habit in habits) {
      for (final date in habit.completionStatus.keys) {
        final day = getDayOfWeek(date);
        habitsCountByDay[day] = (habitsCountByDay[day] ?? 0) + 1;
      }
    }

    // Convert data to chart data
    final List<ChartData> chartData = habitsCountByDay.entries
        .map((entry) => ChartData(day: entry.key, completedHabits: entry.value))
        .toList();

    return SizedBox(
      height: 500,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          StackedColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData ch, _) => ch.day,
            yValueMapper: (ChartData ch, _) => ch.completedHabits,
          ),
        ],
      ),
    );
  }

  String getDayOfWeek(DateTime date) {
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek[date.weekday - 1];
  }
}

class ChartData {
  final String day;
  final int completedHabits;

  ChartData({
    required this.day,
    required this.completedHabits,
  });
}
