import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum StatContainerPos { left, right, center }

class StatContainer extends StatelessWidget {
  final StatContainerPos containerPos;
  const StatContainer({
    super.key,
    required this.containerPos,
  });

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    const size = 140.0;

    return Container(
      padding: const EdgeInsets.all(8.0),
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: containerPos == StatContainerPos.left
              ? Colors.blue.shade900
              : containerPos == StatContainerPos.right
                  ? Colors.red.shade900
                  : Colors.yellow.shade800,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            containerPos == StatContainerPos.left
                ? 'CURRENT\nSTREAK'
                : containerPos == StatContainerPos.right
                    ? 'COMPLETION\nRATE'
                    : 'HABIT\nFINISHED',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              containerPos == StatContainerPos.left
                  ? '0'
                  : containerPos == StatContainerPos.right
                      ? '100%'
                      : '3',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Text(
            containerPos == StatContainerPos.left
                ? 'Best Streak: 2'
                : containerPos == StatContainerPos.right
                    ? '3/3 habits'
                    : 'This week: 0',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
