import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:provider/provider.dart';

import 'habit_item.dart';

class Habits extends StatelessWidget {
  const Habits({super.key});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: habitProvider.habits.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key('key_${habitProvider.habits[index]}'),
        onDismissed: (direction) => habitProvider.removeHabit(index),
        background: Container(color: Colors.red),
        child: HabitTile(
          title: habitProvider.habits[index],
          isDone: habitProvider.isDoneList[index],
          onTap: () {
            habitProvider.finishedTask(index);
          },
          textColor: Colors.amber, // dummy
        ),
      ),
    );
  }
}
