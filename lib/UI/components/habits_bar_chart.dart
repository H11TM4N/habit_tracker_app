import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitsBarChart extends ConsumerStatefulWidget {
  const HabitsBarChart({super.key});

  @override
  ConsumerState<HabitsBarChart> createState() => _HabitsBarChartState();
}

class _HabitsBarChartState extends ConsumerState<HabitsBarChart> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(habitProvider).events;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(4),
          child: TableCalendar(
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: (day) {
              return events[day] ?? [];
            },
          ),
        ),
        // ListView.builder(
        //   itemCount: events.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       onTap: () {},
        //       title: Text('jojo'),
        //     );
        //   },
        // ),
      ],
    );
  }
}
