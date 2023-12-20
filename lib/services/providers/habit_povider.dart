import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/habit.dart';

final habitProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier() : super([]) {
    state = habitBox.values.toList();
  }

  void addHabit(Habit habit) {
    habitBox.add(habit);
    state = habitBox.values.toList();
  }

  void removeHabit(String id) {
    if (state.indexWhere((h) => h.id.compareTo(id) == 0) > -1) {
      habitBox.deleteAt(state.indexWhere((h) => h.id.compareTo(id) == 0));
      state = habitBox.values.toList();
    }
  }

  void clearHabits() {
    if (habitBox.isNotEmpty) {
      habitBox.clear();
    }
    state = habitBox.values.toList();
  }

  void editHabit(Habit habit) {
    int index = state.indexWhere((h) => h.id.compareTo(habit.id) == 0);
    if (index > -1) {
      habitBox.putAt(index, habit);
      state = habitBox.values.toList();
    }
  }

  void toggleCompletion(Habit habit) {
    int index = state.indexWhere((h) => h.id.compareTo(habit.id) == 0);
    if (index > -1) {
      habit.isCompleted = !habit.isCompleted;
      DateTime currentDate = dateFormatter(DateTime.now());
      if (habit.isCompleted && !habit.completionDates.contains(currentDate)) {
        habit.completionDates.add(currentDate); // Add completion date
      } else if (!habit.isCompleted) {
        habit.completionDates.remove(currentDate); // Remove completion date
      }
      // print(habit.completionDates);
      habitBox.putAt(index, habit);
      state = habitBox.values.toList();
    }
  }
}
