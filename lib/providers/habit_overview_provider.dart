import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habit.dart';

final habitOverviewProvider =
    StateNotifierProvider<HabitOverviewNotifier, Habit>((ref) {
  return HabitOverviewNotifier();
});

class HabitOverviewNotifier extends StateNotifier<Habit> {
  HabitOverviewNotifier()
      : super(
          Habit(title: 'None', isDone: false, question: 'Testing Testing...', isEditing: false),
        );
  
  
}
