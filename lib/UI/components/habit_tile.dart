import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/screens/edit_habit_screen.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/habit.dart';

class HabitTile extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final VoidCallback onToggleCompletion;
  final VoidCallback onDelete;
  final Habit habit;

  const HabitTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onToggleCompletion,
    required this.onDelete,
    required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
      child: ListTile(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 15, vertical: isCompleted ? 4 : 12),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: PopupMenuButton(
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.zero,
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {
                rightToLeftNavigation(context, EditHabitScreen(habit: habit));
              },
              child: Text(
                'EDIT',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
              ),
            ),
            PopupMenuItem(
              onTap: onToggleCompletion,
              child: Text(
                isCompleted ? 'UNDO' : 'FINISH',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
              ),
            ),
            PopupMenuItem(
              onTap: onDelete,
              child: Text(
                'DELETE',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
              ),
            ),
          ],
          icon: const Icon(Icons.more_horiz, color: Colors.white),
        ),
        subtitle: isCompleted
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check, size: 16),
                  Text(
                    'Completed',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
                  ),
                ],
              )
            : null,
        tileColor: isCompleted
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primaryContainer,
        titleTextStyle: const TextStyle(color: Colors.white),
        
      ),
    );
  }
}
