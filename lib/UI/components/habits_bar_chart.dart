import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitsBarChart extends StatefulHookConsumerWidget {
  const HabitsBarChart({super.key});

  @override
  ConsumerState<HabitsBarChart> createState() => _HabitsBarChartState();
}

class _HabitsBarChartState extends ConsumerState<HabitsBarChart> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<String>> events = {};
  late final ValueNotifier<List<String>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventForDay(_selectedDay!));
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventForDay(_selectedDay!);
      });
    }
  }

  List<String> _getEventForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    // final events = ref.watch(habitProvider).events;
    TextEditingController textController = TextEditingController();

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(4),
          child: TableCalendar(
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: onDaySelected,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _getEventForDay,
          ),
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  children: [
                    TextField(
                      controller: textController,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      events.addAll({
                        _selectedDay!: [textController.text]
                      });
                      _selectedEvents.value = _getEventForDay(_selectedDay!);
                      Navigator.pop(context);
                    },
                    child: const Text('submit'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Add'),
        ),
        ValueListenableBuilder(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(value[index]),
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}
