import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabelText extends StatelessWidget {
  final String labelText;
  const CustomLabelText({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 15, bottom: 0),
          child: Text(
            labelText,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
