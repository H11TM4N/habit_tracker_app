import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HabitTile extends StatelessWidget {
  final String title;
  final VoidCallback tileOnTap;
  final String subtitle;
  final bool isDone;

  const HabitTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tileOnTap,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(13.0),
          bottomRight: Radius.circular(13.0),
        ),
      ),
      elevation: 9,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.redAccent, // Specify the color of the left border
              width: 5.0, // Specify the width of the left border
            ),
          ),
        ),
        child: ListTile(
          onTap: tileOnTap,
          contentPadding: const EdgeInsets.all(0),
          tileColor: Colors.transparent,
          title: Text(
            '  $title',
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            '  $subtitle',
            style: const TextStyle(fontWeight: FontWeight.w100),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              isDone
                  ? const Icon(
                      FontAwesomeIcons.check,
                      color: Colors.greenAccent,
                    )
                  : const Icon(
                      FontAwesomeIcons.xmark,
                      color: Colors.redAccent,
                    ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
