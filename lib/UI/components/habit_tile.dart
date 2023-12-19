import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitTile extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final VoidCallback onToggleCompletion;
  final VoidCallback onDelete;

  const HabitTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onToggleCompletion,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Card(
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
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
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade400),
                      ),
                    ],
                  )
                : null,
            tileColor: isCompleted
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primaryContainer,
            titleTextStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}