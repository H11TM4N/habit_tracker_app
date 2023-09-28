import 'package:flutter/material.dart';
// import '../providers/habit_provider.dart';

class HabitTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onTap;
  final Color? textColor;

  const HabitTile({
    super.key,
    required this.title,
    required this.isDone,
    required this.onTap,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 9,
        color: Colors.transparent,
        child: ListTile(
          contentPadding: const EdgeInsets.all(9),
          tileColor: Colors.transparent,
          title: Text(
            title,
            style: TextStyle(color: textColor),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onTap,
                child: isDone
                    ? const Icon(
                        Icons.check,
                        color: Colors.blue,
                      )
                    : const Icon(
                        Icons.close,
                        color: Colors.black38,
                      ),
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
