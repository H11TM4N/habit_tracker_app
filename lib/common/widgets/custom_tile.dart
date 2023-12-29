import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';

class CustomTile extends ConsumerWidget {
  final int index;
  final String title;
  final void Function()? onTap;
  const CustomTile({
    super.key,
    required this.index,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitProvider);
    final habit = habits[index];
    final currentDate = dateFormatter(DateTime.now());
    final completionStatus = habit.completionStatus[currentDate] ?? false;

    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: theme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Checkbox(
          shape: const CircleBorder(),
          checkColor: theme.background,
          value: completionStatus,
          onChanged: (value) {
            value = completionStatus;
            ref.read(habitProvider.notifier).toggleCompletion(habits[index]);
          },
        ),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
