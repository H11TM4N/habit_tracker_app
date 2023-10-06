import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habit.dart';

// Import the Habit class here

final habitProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier() : super([]);

  void toggleIsDone(int index) {
    if (index >= 0 && index < state.length) {
      final updatedHabitList = List<Habit>.from(state);
      updatedHabitList[index] = updatedHabitList[index].copyWith(
        isDone: !updatedHabitList[index].isDone,
      );
      state = updatedHabitList;
    }
  }

  void editHabit(int habitId, String newName, String newQuestion) {
    final updatedHabitList = List<Habit>.from(state);
    final index = updatedHabitList.indexWhere((habit) => habit.id == habitId);

    if (index >= 0) {
      updatedHabitList[index] = updatedHabitList[index].copyWith(
        title: newName,
        question: newQuestion,
        isEditing: true,
      );
      state = updatedHabitList;
    }
  }

  void addHabit(String newHabitName, String newQuestion, bool isEditing) {
    if (newHabitName.isNotEmpty) {
      final newHabit = Habit(
        id: state.length + 1, // Assign a unique ID
        title: newHabitName,
        question: newQuestion,
        isDone: false,
        isEditing: isEditing,
      );
      state = [...state, newHabit];
    }
  }

  void removeHabit(int index) {
    if (index >= 0 && index < state.length) {
      final updatedHabitList = List<Habit>.from(state);
      updatedHabitList.removeAt(index);
      state = updatedHabitList;
    }
  }

  void reorderHabit(int oldIndex, int newIndex) {
    if (oldIndex >= 0 &&
        oldIndex < state.length &&
        newIndex >= 0 &&
        newIndex < state.length) {
      final updatedHabitList = List<Habit>.from(state);
      final Habit movedHabit = updatedHabitList.removeAt(oldIndex);
      updatedHabitList.insert(newIndex, movedHabit);
      state = updatedHabitList;
    }
  }
}
