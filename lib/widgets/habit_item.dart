// import 'package:flutter/material.dart';

// import 'progress_painter.dart';

// class HabitListItem extends StatelessWidget {
//   final String habitName;
//   final double progress;
//   final int index;
//   const HabitListItem(
//       {super.key,
//       required this.habitName,
//       required this.progress,
//       required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       key: Key('$index'),
//       title: Text(habitName),
//       trailing: CustomPaint(
//         size: const Size(20, 20), // Size of the progress circle
//         painter: ProgressPainter(progress: progress),
//       ),
//     );
//   }
// }

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

    return ListTile(
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
    );
  }
}
