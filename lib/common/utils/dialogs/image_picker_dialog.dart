import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

imageDialog(
  BuildContext context, {
  required void Function() onTakePic,
  required void Function() onSelectPic,
}) {
  final theme = Theme.of(context).colorScheme;
  TextStyle textStyle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w800,
    fontSize: 14,
  );
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: onTakePic,
                  child: Row(
                    children: [
                      const Icon(Icons.photo_camera),
                      const SizedBox(width: 10),
                      Text('TAKE A PICTURE', style: textStyle),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: onSelectPic,
                  child: Row(
                    children: [
                      const Icon(Icons.photo),
                      const SizedBox(width: 10),
                      Text('SELECT FROM GALLERY', style: textStyle),
                    ],
                  ),
                ),
              ],
            ),
          ]),
      backgroundColor: theme.primary,
    ),
  );
}
