import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HabitsLinearProgress extends StatelessWidget {
  const HabitsLinearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 40,
        animation: true,
        lineHeight: 25.0,
        animationDuration: 2500,
        percent: 0.8,
        center: Text(
          "80%",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
          ),
        ),
        barRadius: const Radius.circular(12),
        progressColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
