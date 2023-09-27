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
