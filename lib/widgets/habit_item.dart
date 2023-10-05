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
      elevation: 9,
      color: Colors.transparent,
      child: ListTile(
        onTap: tileOnTap,
        contentPadding: const EdgeInsets.all(9),
        tileColor: Colors.transparent,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontWeight: FontWeight.w100),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isDone
                ? const Icon(
                    FontAwesomeIcons.check,
                    color: Colors.white,
                  )
                : const Icon(
                    FontAwesomeIcons.xmark,
                    color: Colors.red,
                  ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
