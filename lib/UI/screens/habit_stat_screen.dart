// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:habit_tracker_app/UI/screens/edit_habit_screen.dart';
// import 'package:habit_tracker_app/common/common.dart';
// import 'package:habit_tracker_app/models/habit.dart';

// class HabitStatScreen extends ConsumerWidget {
//   final Habit habit;
//   const HabitStatScreen({
//     super.key,
//     required this.habit,
//   });
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {
//                 // rightToLeftNavigation(context, EditHabitScreen(habit: habit));
//               },
//               icon: const Icon(Icons.edit)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
//           PopupMenuButton(
//             color: Theme.of(context).colorScheme.primary,
//             padding: EdgeInsets.zero,
//             itemBuilder: (context) => [
//               PopupMenuItem(
//                 onTap: () {},
//                 child: Text(
//                   'EDIT',
//                   style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
//                 ),
//               ),
//               PopupMenuItem(
//                 onTap: () {},
//                 child: Text(
//                   'FINISH',
//                   style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
//                 ),
//               ),
//               PopupMenuItem(
//                 onTap: () {},
//                 child: Text(
//                   'DELETE',
//                   style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ],
//             icon: const Icon(Icons.more_horiz, color: Colors.white),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [],
//       ),
//     );
//   }
// }
