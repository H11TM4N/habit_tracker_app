import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/components/habit_tile.dart';
import 'package:habit_tracker_app/UI/screens/create_habit_screen.dart';
import 'package:habit_tracker_app/UI/screens/habit_stat_screen.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
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
    final textStyle = GoogleFonts.montserrat(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    if (habits.isEmpty) {
      return Container(
        color: theme.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .25),
            // Image.asset(
            //   'assets/images/habit-splash.png',
            //   scale: 5,
            // ),
            Text(
              'No habits added yet',
              style: GoogleFonts.montserrat(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                bottomToTopNavigation(context, const CreateHabitScreen());
              },
              child: Text(
                'Add your first habit',
                style: textStyle,
              ),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, index) {
            final habit = habits[index];
            final currentDate = dateFormatter(DateTime.now());
            final completionStatus =
                habit.completionStatus[currentDate] ?? false;
            return Row(
              children: [
                Checkbox(
                  shape: const CircleBorder(),
                  checkColor: theme.background,
                  value: completionStatus,
                  onChanged: (value) {
                    value = completionStatus;
                    ref
                        .read(habitProvider.notifier)
                        .toggleCompletion(habits[index]);
                  },
                ),
                Expanded(
                  child: HabitTile(
                    title: habits[index].title,
                    isCompleted: completionStatus,
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
                    habit: habits[index],
                    tileOnTap: () {
                      smoothNavigation(
                          context, HabitStatScreen(habit: habits[index]));
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );
    }
  }
}
