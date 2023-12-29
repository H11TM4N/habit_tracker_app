import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/UI/screens/edit_habit_screen.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';

class HabitStatScreen extends ConsumerWidget {
  final Habit habit;
  const HabitStatScreen({
    super.key,
    required this.habit,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                rightToLeftNavigation(context, EditHabitScreen(habit: habit));
              },
              icon: const Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          PopupMenuButton(
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
                onTap: () {
                  ref.read(habitProvider.notifier).removeHabit(habit.id);
                  Navigator.pop(context);
                },
                child: Text(
                  'DELETE',
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                ),
              ),
            ],
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              habit.title,
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StatContainer(containerPos: StatContainerPos.left),
                  SizedBox(width: 20),
                  StatContainer(containerPos: StatContainerPos.center),
                  SizedBox(width: 20),
                  StatContainer(containerPos: StatContainerPos.right),
                  SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const HabitsHeatMap()
          ],
        ),
      ),
    );
  }
}
