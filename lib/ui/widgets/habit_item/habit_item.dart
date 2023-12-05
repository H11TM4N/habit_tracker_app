import 'package:flutter/material.dart';
import 'package:habit_tracker_app/ui/widgets/custom_widgets/custom_listtile.dart';

class HabitTile extends StatelessWidget {
  final String title;
  final VoidCallback tileOnTap;
  final String subtitle;
  final bool isDone;
  final VoidCallback onRemove;
  final VoidCallback onToggle;

  const HabitTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tileOnTap,
    required this.isDone,
    required this.onRemove,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 9,
      color: Theme.of(context).colorScheme.primary,
      child: KlistTile(
        tileOnTap: tileOnTap,
        title: title,
        isDone: isDone,
        onRemove: onRemove,
        onToggle: onToggle,
      ),
    );
  }
}
