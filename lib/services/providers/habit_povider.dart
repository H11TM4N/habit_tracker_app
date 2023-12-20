import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/habit.dart';

final habitProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier() : super([]) {
    state = box.values.toList();
  }

  void addHabit(Habit habit) {
    box.add(habit);
    state = box.values.toList();
  }

  void removeHabit(String id) {
    if (state.indexWhere((h) => h.id.compareTo(id) == 0) > -1) {
      box.deleteAt(state.indexWhere((h) => h.id.compareTo(id) == 0));
      state = box.values.toList();
    }
  }

  void clearHabits() {
    box.clear();
    state = box.values.toList();
  }

  void editHabit(Habit habit) {
    int index = state.indexWhere((h) => h.id.compareTo(habit.id) == 0);
    if (index > -1) {
      box.putAt(index, habit);
      state = box.values.toList();
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
      box.putAt(index, habit);
      state = box.values.toList();
    }
  }
}
