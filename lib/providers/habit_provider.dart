import 'package:flutter/material.dart';

class HabitProvider extends ChangeNotifier {
  List<String> habits = [];
  List<bool> isDoneList = [];

  void addHabit(BuildContext context, String value) {
    Navigator.pop(context);
    habits.add(value);
    isDoneList.add(false);
    notifyListeners();
  }

  void removeHabit(int index, BuildContext context) {
    habits.removeAt(index);
    isDoneList.removeAt(index);
    showSnackBAr(context);
    notifyListeners();
  }

  void finishedTask(int index) {
    isDoneList[index] = !isDoneList[index];
    notifyListeners();
  }

  void showSnackBAr(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Habit removed'),
        backgroundColor: Colors.black26,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      ),
    );
  }

  void saveHabit() {}
}
