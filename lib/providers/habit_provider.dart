import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/models/habit_list.dart';

final habitProvider = StateNotifierProvider<HabitNotifier, HabitList>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<HabitList> {
  HabitNotifier() : super(HabitList(habits: []));

  void toggleIsDone(int index) {
    if (index >= 0 && index < state.habits.length) {
      final updatedHabitList = List<Habit>.from(state.habits);
      updatedHabitList[index].isDone = !updatedHabitList[index].isDone;

      state = HabitList(habits: updatedHabitList);
    }
  }

  void editHabit(int index, String newName, String newQuestion) {
    if (index >= 0 && index < state.habits.length) {
      final updatedHabitList = List<Habit>.from(state.habits);
      updatedHabitList[index].title = newName;
      updatedHabitList[index].question = newQuestion;

      state = HabitList(habits: updatedHabitList);
    }
  }

  void addHabit(String newHabitName, String newQuestion, bool isEditing) {
    if (newHabitName.isNotEmpty) {
      final newHabit = Habit(
          title: newHabitName,
          isDone: false,
          question: newQuestion,
          isEditing: isEditing);
      final updatedHabitList = state.habits + [newHabit];

      state = HabitList(habits: updatedHabitList);
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
