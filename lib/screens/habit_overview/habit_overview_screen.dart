import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitOverviewScreen extends StatelessWidget {
  final String habitName;
  const HabitOverviewScreen({
    super.key,
    required this.habitName,
  });

  @override
  Widget build(BuildContext context) {
    
    CalendarFormat calendarFormat = CalendarFormat.month;
    DateTime focusedDay = DateTime.now();
    DateTime? _selectedDay;

    return Scaffold(
      appBar: AppBar(
        title: Text(habitName),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: focusedDay,
            calendarFormat: calendarFormat,
            onFormatChanged: (format) {
              calendarFormat = format;
            },
            onDaySelected: (selectedDay, focusedDay) {
              _selectedDay = selectedDay;
            },
            // You can add event markers to highlight days with habits here
            // Example: eventLoader: yourEventLoaderFunction,
          ),
        ],
      ),
    );
  }
}
