import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habit.dart';

final habitProvider = StateNotifierProvider<HabitNotifier, HabitList>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<HabitList> {
  HabitNotifier() : super(HabitList(habits: []));

  TextEditingController habitNameController = TextEditingController();
  TextEditingController questionController = TextEditingController();

  void toggleIsDone(int index) {
    if (index >= 0 && index < state.habits.length) {
      final updatedHabitList = List<Habit>.from(state.habits);
      updatedHabitList[index].isDone = !updatedHabitList[index].isDone;

      state = HabitList(habits: updatedHabitList);
    }
  }

  void addHabit() {
    final newHabitName = habitNameController.text;
    final newQuestion = questionController.text;

    if (newHabitName.isNotEmpty) {
      final newHabit = Habit(
        title: newHabitName,
        isDone: false,
        question: newQuestion,
      );
      final updatedHabitList = state.habits + [newHabit];

      state = HabitList(habits: updatedHabitList);

      habitNameController.clear();
      questionController.clear();
    }
  }

  void removeHabit(int index) {
    if (index >= 0 && index < state.habits.length) {
      final updatedHabitList = List<Habit>.from(state.habits);
      updatedHabitList.removeAt(index);

      state = HabitList(habits: updatedHabitList);
    }
  }

  void reorderHabit(int oldIndex, int newIndex) {
    if (oldIndex >= 0 &&
        oldIndex < state.habits.length &&
        newIndex >= 0 &&
        newIndex < state.habits.length) {
      final updatedHabitList = List<Habit>.from(state.habits);
      final Habit movedHabit = updatedHabitList.removeAt(oldIndex);
      updatedHabitList.insert(newIndex, movedHabit);

      state = HabitList(habits: updatedHabitList);
    }
  }
}
