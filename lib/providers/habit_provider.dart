import 'package:flutter/material.dart';

class HabitProvider extends ChangeNotifier {
  List<String> habits = [];
  List<bool> isDoneList = [];
  List<String> removedHabits = []; // Store temporarily removed habits

  void addHabit(BuildContext context, String value) {
    Navigator.pop(context);
    habits.add(value);
    isDoneList.add(false);
    notifyListeners();
  }

  void removeHabit(int index, BuildContext context) {
    String removedHabit = habits.removeAt(index); // Remove and store the habit
    isDoneList.removeAt(index);
    removedHabits.add(removedHabit); // Store the removed habit
    showSnackBar(
        context, removedHabit); // Pass the removed habit to the Snackbar
    notifyListeners();
  }

  void undoRemove(BuildContext context) {
    if (removedHabits.isNotEmpty) {
      String habitToUndo =
          removedHabits.removeLast(); // Get the last removed habit
      habits.add(habitToUndo); // Add the removed habit back to the list
      isDoneList.add(false);
      notifyListeners();
    }
  }

  void finishedTask(int index) {
    isDoneList[index] = !isDoneList[index];
    notifyListeners();
  }

  int get completedHabitsCount {
    return isDoneList.where((isDone) => isDone).length;
  }

  void showSnackBar(BuildContext context, String removedHabit) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          'Habit removed: $removedHabit',
          style: const TextStyle(color: Colors.white),
        ), // Show the removed habit
        backgroundColor: Colors.black26,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            undoRemove(context);
          },
        ),
      ),
    );
  }

  void saveHabit() {}
}
