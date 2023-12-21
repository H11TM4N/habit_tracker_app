import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StatPage extends ConsumerWidget {
  const StatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final habits = ref.watch(habitProvider);
    final completed = habits.where((habit) => habit.isCompleted).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Card(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'OVERALL PROGRESS',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              '${completed.length}/${habits.length} habits done',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade900),
                            ),
                          ),
                          Wrapper(
                              text: DateFormat('MMM d').format(DateTime.now()))
                        ],
                      ),
                      const Spacer(),
                      Expanded(
                        child: CircularPercentIndicator(
                          radius: 40.0,
                          animation: true,
                          lineWidth: 5.0,
                          percent: (completed.length / habits.length).isNaN
                              ? 0
                              : completed.length / habits.length,
                          center: Text(
                            (completed.length / habits.length * 100).isNaN
                                ? '0%'
                                : '${(completed.length / habits.length * 100).toInt()}%',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          progressColor: Colors.blue,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
