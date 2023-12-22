import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OverviewCard extends StatelessWidget {
  final List<Habit> completed;
  final List<Habit> habits;
  const OverviewCard({
    super.key,
    required this.completed,
    required this.habits,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Card(
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
                    style: GoogleFonts.montserrat(color: Colors.grey.shade900),
                  ),
                ),
                Wrapper(text: DateFormat('MMM d').format(DateTime.now()))
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
    );
  }
}
