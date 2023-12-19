import 'package:flutter/material.dart';
import 'package:habit_tracker_app/UI/components/habit_tile.dart';
import 'package:habit_tracker_app/providers/habit_povider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HabitListView extends StatefulHookConsumerWidget {
  const HabitListView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HabitListViewState();
}

class _HabitListViewState extends ConsumerState<HabitListView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final habits = ref.watch(habitProvider);

    return Expanded(
        child: ListView.builder(
      itemCount: ref.watch(habitProvider).length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Checkbox(
              shape: const CircleBorder(),
              checkColor: theme.background,
              value: habits[index].isCompleted,
              onChanged: (value) {
                value = habits[index].isCompleted;
                ref
                    .read(habitProvider.notifier)
                    .toggleCompletion(habits[index]);
              },
            ),
            Expanded(
              child: HabitTile(
                title: habits[index].title,
                isCompleted: habits[index].isCompleted,
                onToggleCompletion: () {
                  ref
                      .read(habitProvider.notifier)
                      .toggleCompletion(habits[index]);
                },
                onDelete: () {
                  ref
                      .read(habitProvider.notifier)
                      .removeHabit(habits[index].id);
                },
              ),
            ),
          ],
        );
      },
    ));
  }
}
