import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/current_date_provider.dart';
import '../../providers/habit_provider.dart';

class DateTile extends StatelessWidget {
  const DateTile({super.key});

  @override
  Widget build(BuildContext context) {
    DateProvider dateProvider = Provider.of<DateProvider>(context);
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Today'),
              Text(
                dateProvider.currentDate,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .55,
            height: 3,
          ),
          Text(
            '${habitProvider.completedHabitsCount}/${habitProvider.habits.length}',
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
