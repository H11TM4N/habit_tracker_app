// import 'package:flutter/material.dart';

// import 'progress_painter.dart';

// class HabitListItem extends StatelessWidget {
//   final String habitName;
//   final double progress;
//   const HabitListItem({super.key, required this.habitName, required this.progress});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(habitName),
//       trailing: CustomPaint(
//         size: const Size(20, 20), // Size of the progress circle
//         painter: ProgressPainter(progress: progress),
//       ),
//     );
//   }
// }