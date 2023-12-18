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
    final index = state.length;
    box.putAt(index, habit);
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
      habit.isComleted = !habit.isComleted;
      box.putAt(index, habit);
      state = box.values.toList();
    }
  }
}
