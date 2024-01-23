import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/UI/pages/views/history_view.dart';
import 'package:habit_tracker_app/UI/pages/views/overview_card.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';

class StatPage extends ConsumerWidget {
  const StatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final theme = Theme.of(context).colorScheme;
    final habits = ref.watch(habitProvider).habits;
    final currentDate = dateFormatter(DateTime.now());
    final completed = habits.where((habit) {
      return habit.completionStatus[currentDate] == true;
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'overview',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
              OverviewCard(
                completed: completed,
                habits: habits,
              ),
              const SizedBox(height: 30),
              const HabitsBarChart(),
              const SizedBox(height: 30),
              const HistoryView(),
            ],
          ),
        ),
      ),
    );
  }
}
