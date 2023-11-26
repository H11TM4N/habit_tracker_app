import 'package:flutter/material.dart';
import 'package:habit_repository/habit_repository.dart';
import 'package:habit_tracker_app/ui/pages/habit_overview_page.dart';
import 'package:provider/provider.dart';

import '../../common/common.dart';
import '../../constants/constants.dart';
import '../../logic/providers/habit_provider.dart';
import '../widgets/widgets.dart';

class HabitBody extends StatelessWidget {
  const HabitBody({
    super.key,
    required this.status,
    required this.habits,
    required bool showUnfinishedTasks,
  }) : _showUnfinishedTasks = showUnfinishedTasks;

  final HabitStatus status;
  final List<Habit> habits;
  final bool _showUnfinishedTasks;

  @override
  Widget build(BuildContext context) {
    return status == HabitStatus.success
        ? ListView.builder(
            key: Key('Key ${habits.length} '),
            itemCount: habits.length,
            itemBuilder: (context, index) {
              if (_showUnfinishedTasks && habits[index].isDone) {
                return const SizedBox.shrink();
              } else {
                return KslidableWidget(
                  key: Key('key $index'),
                  onCheck: (_) =>
                      context.read<HabitProvider>().toggleHabit(index),
                  onDelete: (_) {
                    context.read<HabitProvider>().removeHabit(habits[index]);
                    showSnackBar(context, 'Habit removed');
                  },
                  isDone: habits[index].isDone,
                  child: HabitTile(
                    title: habits[index].title,
                    subtitle: habits[index].subtitle,
                    tileOnTap: () {
                      smoothTransition(
                        context: context,
                        page: HabitOverviewPage(index: index),
                      );
                    },
                    isDone: habits[index].isDone,
                  ),
                );
              }
            },
          )
        : status == HabitStatus.initial
            ? const Center(child: Text('No habits added yet...'))
            : const Text('Error');
  }
}
