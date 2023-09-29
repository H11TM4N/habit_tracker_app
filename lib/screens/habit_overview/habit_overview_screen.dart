import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/habit_overview_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitOverviewScreen extends StatelessWidget {
  final String habitName;
  const HabitOverviewScreen({
    super.key,
    required this.habitName,
  });

  @override
  Widget build(BuildContext context) {
    HabitOverviewProvider habitOverviewProvider =
        Provider.of<HabitOverviewProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(habitName),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: habitOverviewProvider.focusedDay,
            calendarFormat: habitOverviewProvider.calendarFormat,
            onFormatChanged: (format) {
              habitOverviewProvider.calendarFormat = format;
            },
            onDaySelected: (selectedDay, focusedDay) {
              habitOverviewProvider.selectedDay = selectedDay;
            },
            // You can add event markers to highlight days with habits here
            // Example: eventLoader: yourEventLoaderFunction,
          ),
        ],
      ),
    );
  }
}
