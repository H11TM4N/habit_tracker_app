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
  });

  final HabitStatus status;
  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    return status == HabitStatus.success
        ? ListView.builder(
            key: Key('Key ${habits.length} '),
            itemCount: habits.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    value: context.watch<HabitProvider>().habits[index].isDone,
                    onChanged: (value) {
                      context.read<HabitProvider>().toggleHabit(index);
                    },
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: HabitTile(
                      title: habits[index].title,
                      subtitle: habits[index].note,
                      tileOnTap: () {
                        smoothTransition(
                          context: context,
                          page: HabitOverviewPage(index: index),
                        );
                      },
                      isDone: habits[index].isDone,
                      onRemove: () {
                        context
                            .read<HabitProvider>()
                            .removeHabit(habits[index]);
                      },
                      onToggle: () {
                        context.read<HabitProvider>().toggleHabit(index);
                      },
                    ),
                  ),
                ],
              );
            },
          )
        : status == HabitStatus.initial
            ? const Center(child: Text('No habits added yet...'))
            : const Text('Error');
  }
}
