import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/cubits/habit_state.dart';

class HabitCubit extends Cubit<List<HabitState>> {
  HabitCubit() : super([]);

  void addHabit(String newHabitName, String newQuestion, bool isEditing) {
    if (newHabitName.isNotEmpty) {
      final newHabit = HabitState(
        id: state.length + 1,
        title: newHabitName,
        question: newQuestion,
        isDone: false,
      );
      final newHabitList = List<HabitState>.from(state)..add(newHabit);
      emit(newHabitList);
    }
  }

  void removeHabit(int id) {
    final taskToRemove = state.indexWhere((task) => task.id == id);
    final updatedHabits = List<HabitState>.from(state)..removeAt(taskToRemove);

    emit(updatedHabits);
  }

  void editHabit(int habitId, String newName, String newQuestion) {
  final updatedHabits = List<HabitState>.from(state);
  final index = updatedHabits.indexWhere((habit) => habit.id == habitId);

  if (index >= 0) {
    updatedHabits[index] = updatedHabits[index].copyWith(
      title: newName,
      question: newQuestion,
    );
    emit(updatedHabits);
  }
}


  void toggleIsDone(int index) {
    if (index >= 0 && index < state.length) {
      final updatedHabits = List<HabitState>.from(state);
      updatedHabits[index] = updatedHabits[index].copyWith(
        isDone: !updatedHabits[index].isDone,
      );
      emit(updatedHabits);
    }
  }

  void reorderHabit(int oldIndex, int newIndex) {
    if (oldIndex >= 0 &&
        oldIndex < state.length &&
        newIndex >= 0 &&
        newIndex < state.length) {
      final updatedHabits = List<HabitState>.from(state);
      final HabitState movedHabit = updatedHabits.removeAt(oldIndex);
      updatedHabits.insert(newIndex, movedHabit);

      emit(updatedHabits);
    }
  }
}
