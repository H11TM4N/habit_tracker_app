import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/cubits/habit_cubit.dart';
import 'package:habit_tracker_app/logic/cubits/habit_state.dart';
import 'package:habit_tracker_app/presentation/pages/edit_habit_page.dart';
import 'package:habit_tracker_app/presentation/utils/container.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_page_transition/custom_page_route_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitOverview extends StatelessWidget {
  final String habitName;
  final String habitQuestion;
  final int index;
  final bool isDone;

  const HabitOverview({
    super.key,
    required this.habitName,
    required this.habitQuestion,
    required this.index,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final habitCubit = context.watch<HabitCubit>();
    final habit = habitCubit.state[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(habitName),
        actions: [
          BlocBuilder<HabitCubit, List<HabitState>>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MyCustomRouteTransition(
                      route: EditHabitPage(
                        habitData: HabitState(
                          id: index,
                          isDone: isDone,
                          title: habitName,
                          question: habitQuestion,
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
              );
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry<dynamic>>[
                PopupMenuItem(
                  onTap: () {
                    Navigator.pop(context);
                    habitCubit.removeHabit(index);
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
                  lastDay: DateTime.now(),
                  selectedDayPredicate: (day) {
                    return habit.completionDates.contains(day);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
