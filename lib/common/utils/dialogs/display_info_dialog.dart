import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

displayInfoDialog(
  BuildContext context,
  TextStyle style, {
  required String displayName,
  required String gender,
}) {
  final theme = Theme.of(context).colorScheme;
  TextStyle textStyle = GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('USER INFO', style: style),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'DISPLAY NAME: ',
                      style: style,
                    ),
                    Text(displayName, style: textStyle),
                  ],
                ),
                Row(
                  children: [
                    Text('GENDER: ', style: style),
                    Text(gender, style: textStyle),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'AGE: ',
                      style: style,
                    ),
                    Text('who knows...', style: textStyle),
                  ],
                ),
              ],
            ),
            backgroundColor: theme.primary,
          ));
}
