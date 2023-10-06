import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/screens/add_habit_screen.dart';
import 'package:habit_tracker_app/utils/container.dart';
import 'package:habit_tracker_app/widgets/custom_page_transition/custom_page_route_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitOverview extends ConsumerWidget {
  final String habitName;
  final int index;

  const HabitOverview({
    super.key,
    required this.habitName,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(habitName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MyCustomRouteTransition(
                  route: AddHabitScreen(
                    habitData: Habit(
                        id: index,
                        title: habitName,
                        isDone: false,
                        question: '',
                        isEditing: true),
                    habitIndex: index,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry<dynamic>>[
                PopupMenuItem(
                  onTap: () {
                    Navigator.pop(context);
                    ref.watch(habitProvider.notifier).removeHabit(index);
                  },
                  child: const Text('delete'),
                )
              ];
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
                child: Kcontainer(
                  widget: Row(
                    children: [
                      const Text(
                        'Overview',
                        style: TextStyle(fontSize: 21),
                      ),
                      const SizedBox(width: 20),
                      CircularPercentIndicator(
                        radius: 20,
                        percent: 0.4,
                      ),
                    ],
                  ),
                ),
              ),
              Kcontainer(
                widget: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(DateTime.february),
                    lastDay: DateTime.now()),
              )
            ],
          ),
        ],
      ),
    );
  }
}
