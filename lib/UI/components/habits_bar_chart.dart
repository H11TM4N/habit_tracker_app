import 'package:flutter/material.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitsCalendar extends ConsumerWidget {
  const HabitsCalendar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    const CalendarFormat calendarFormat = CalendarFormat.month;
    DateTime focusedDayy = ref.watch(habitProvider).habitEvent.focusedDay;
    DateTime selectedDay = ref.watch(habitProvider).habitEvent.selectedDay;
    final selectedEvents = ref.watch(habitProvider).habitEvent.selectedEvents;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(4),
          child: TableCalendar(
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            calendarFormat: calendarFormat,
            availableGestures: AvailableGestures.none,
            focusedDay: focusedDayy,
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              ref
                  .read(habitProvider.notifier)
                  .onDaySelected(selectedDay, focusedDay);
            },
            onPageChanged: (focusedDay) {
              ref.read(habitProvider.notifier).onPageChanged(focusedDay);
            },
            eventLoader: (day) {
              return ref.read(habitProvider.notifier).getEventForDay(day);
            },
          ),
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: selectedEvents.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  tileColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(selectedEvents[index].title),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
