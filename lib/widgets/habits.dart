import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/screens/habit_overview/habit_overview_screen.dart';
import 'package:habit_tracker_app/widgets/custom_page_transition/custom_page_route_transition.dart';
import 'package:provider/provider.dart';
import '../providers/create_habit_provider.dart';
import 'habit_item.dart';

class Habits extends StatelessWidget {
  const Habits({super.key});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    CreateHabitProvider createHabitProvider =
        Provider.of<CreateHabitProvider>(context);

    return ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemCount: habitProvider.habits.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key('key_${habitProvider.habits[index]}'),
        onDismissed: (direction) => habitProvider.removeHabit(index, context),
        background: Container(
          color: Colors.red,
          child: const Icon(Icons.delete),
        ),
        child: HabitTile(
          title: habitProvider.habits[index],
          isDone: habitProvider.isDoneList[index],
          tileOnTap: () => Navigator.of(context).push(
            MyCustomRouteTransition(route: const HabitOverviewScreen()),
          ),
          onTap: () => habitProvider.finishedTask(index),
          textColor:
              createHabitProvider.habitTextColor ?? Colors.white, // dummy
        ),
      ),
    );
  }
}
