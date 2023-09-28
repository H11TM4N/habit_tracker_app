import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';

class HabitTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onTap;

  const HabitTile(
      {super.key,
      required this.title,
      required this.isDone,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(9),
        tileColor: Colors.black26,
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onTap,
              child: isDone
                  ? const Icon(
                      Icons.check,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.close,
                      color: Colors.blue,
                    ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
