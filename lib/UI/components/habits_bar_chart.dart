import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HabitsBarChart extends StatefulWidget {
  const HabitsBarChart({
    super.key,
  });

  @override
  State<HabitsBarChart> createState() => _HabitsBarChartState();
}

class _HabitsBarChartState extends State<HabitsBarChart> {
  final List<ChartData> chartData = [
    ChartData(day: 'Mon', completedHabits: 3),
    ChartData(day: 'Tue', completedHabits: 5),
    ChartData(day: 'Wed', completedHabits: 2),
    ChartData(day: 'Thur', completedHabits: 4),
    ChartData(day: 'Fri', completedHabits: 1),
    ChartData(day: 'Sat', completedHabits: 6),
    ChartData(day: 'Sun', completedHabits: 7),
  ];

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
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
}

class ChartData {
  final String day;
  final int completedHabits;

  ChartData({
    required this.day,
    required this.completedHabits,
  });
}
