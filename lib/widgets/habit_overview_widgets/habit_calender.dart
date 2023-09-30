import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../providers/habit_overview_provider.dart';

class HabitCalender extends StatelessWidget {
  const HabitCalender({super.key});

  @override
  Widget build(BuildContext context) {
    HabitOverviewProvider habitOverviewProvider =
        Provider.of<HabitOverviewProvider>(context);

    return Column(
      children: [
        DropdownButton<CalendarFormat>(
          value: habitOverviewProvider.calendarFormat,
          onChanged: (CalendarFormat? newFormat) {
            if (newFormat != null) {
              habitOverviewProvider.calendarFormat = newFormat;
            }
          },
          items: const [
            DropdownMenuItem(
              value: CalendarFormat.month,
              child: Text('Month'),
            ),
            DropdownMenuItem(
              value: CalendarFormat.week,
              child: Text('Week'),
            ),
            DropdownMenuItem(
              value: CalendarFormat.twoWeeks,
              child: Text('2 Weeks'),
            ),
          ],
        ),
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
          // eventLoader: ,
          // You can add event markers to highlight days with habits here
          // Example: eventLoader: yourEventLoaderFunction,
        ),
      ],
    );
  }
}
