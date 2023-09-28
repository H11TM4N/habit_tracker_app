import 'package:flutter/material.dart';

class HabitProvider extends ChangeNotifier {
  List<String> habits = [];
  List<bool> isDoneList = [];

  void addHabit(BuildContext context ,String value) {
    Navigator.pop(context);
    habits.add(value);
    isDoneList.add(false);
    notifyListeners();
  }

  void removeHabit(int index) {
    habits.removeAt(index);
    isDoneList.removeAt(index);
    notifyListeners();
  }

  void finishedTask(int index) {
    isDoneList[index] = !isDoneList[index];
    notifyListeners();
  }

  void saveHabit() {}
  
}
