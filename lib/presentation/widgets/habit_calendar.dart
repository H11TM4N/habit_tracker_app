import 'package:flutter/material.dart';
import 'package:habit_tracker_app/data/models/habit_completion.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitCalendar extends StatefulWidget {
  final Map<DateTime, List<HabitCompletion>> habitCompletions;

  const HabitCalendar({super.key, required this.habitCompletions});

  @override
  State<HabitCalendar> createState() => _HabitCalendarState();
}

class _HabitCalendarState extends State<HabitCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2023, 12, 31),
      startingDayOfWeek: StartingDayOfWeek.monday,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          selectedDay = selectedDay;
        });
      },
      eventLoader: (day) {
        return widget.habitCompletions[day] ?? [];
      },
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, day, events) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Text(
              day.day.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
        todayBuilder: (context, day, events) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Text(
              day.day.toString(),
              style: const TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}
