import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/screens/add_habit_screen.dart';
import 'package:habit_tracker_app/screens/habit_overview.dart';
import 'package:habit_tracker_app/widgets/custom_page_transition/custom_page_route_transition.dart';
import 'package:habit_tracker_app/widgets/custom_slidable_widget/slidable_widget.dart';
import 'package:habit_tracker_app/widgets/habit_item/habit_item.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitList = ref.watch(habitProvider);
    final habits = habitList.habits;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MyCustomRouteTransition(
                  route: AddHabitScreen(
                    habitData: Habit(
                      title: '',
                      isDone: false,
                      question: '',
                      isEditing: false,
                    ),    
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.transparent,
            leading: const Text(
              'Today\'s\n Habits',
              style: TextStyle(fontSize: 15),
            ),
            trailing: Text(
              DateFormat('EEE, MMM d').format(DateTime.now()),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              onReorder: (oldIndex, newIndex) {
                ref
                    .watch(habitProvider.notifier)
                    .reorderHabit(oldIndex, newIndex);
              },
              itemCount: habits.length,
              itemBuilder: (context, index) => KslidableWidget(
                key: Key('$index'),
                isDone: habits[index].isDone,
                onDelete: (ctx) =>
                    ref.watch(habitProvider.notifier).removeHabit(index),
                onCheck: (ctx) =>
                    ref.watch(habitProvider.notifier).toggleIsDone(index),
                child: HabitTile(
                  title: habits[index].title,
                  subtitle: habits[index].question,
                  isDone: habits[index].isDone,
                  tileOnTap: () {
                    Navigator.push(
                        context,
                        MyCustomRouteTransition(
                            route: HabitOverview(
                          index: index,
                          habitName: habits[index].title,
                        )));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
