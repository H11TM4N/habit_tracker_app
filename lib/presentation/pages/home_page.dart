import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/cubits/habit_cubit.dart';
import 'package:habit_tracker_app/logic/cubits/habit_state.dart';
import 'package:habit_tracker_app/presentation/pages/add_habit_page.dart';
import 'package:habit_tracker_app/presentation/pages/habit_overview_page.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_page_transition/custom_page_route_transition.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_slidable_widget/slidable_widget.dart';
import 'package:habit_tracker_app/presentation/widgets/habit_item/habit_item.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final habitCubit = context.watch<HabitCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MyCustomRouteTransition(
                  route: AddHabitPage(
                    habitData: HabitState(
                      id: 0,
                      title: '',
                      isDone: false,
                      question: '',
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
            child: BlocBuilder<HabitCubit, List<HabitState>>(
              builder: (context, state) {
                return ReorderableListView.builder(
                  onReorder: (oldIndex, newIndex) {
                    habitCubit.reorderHabit(oldIndex, newIndex);
                  },
                  itemCount: state.length,
                  itemBuilder: (context, index) => KslidableWidget(
                    key: Key('$index'),
                    isDone: state[index].isDone,
                    onDelete: (ctx) => habitCubit.removeHabit(state[index].id),
                    onCheck: (ctx) => habitCubit.toggleIsDone(index),
                    child: HabitTile(
                      title: state[index].title,
                      subtitle: state[index].question,
                      isDone: state[index].isDone,
                      tileOnTap: () {
                        Navigator.push(
                          context,
                          MyCustomRouteTransition(
                            route: HabitOverview(
                              habitName: state[index].title,
                              index: state[index].id,
                              isDone: state[index].isDone,
                              habitQuestion: state[index].question,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
