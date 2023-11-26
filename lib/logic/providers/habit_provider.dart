import 'package:flutter/material.dart';
import 'package:habit_repository/habit_repository.dart';

import '../../constants/constants.dart';

abstract class IHabitProvider {
  List<Habit> get habits;
  HabitStatus get status;

  void habitStarted();
  void addHabit(Habit habit);
  void removeHabit(Habit habit);
  void toggleHabit(int index);
  void editHabit(int index, Habit updatedHabit);
  void reorderHabits(int oldIndex, int newIndex, Habit movedHabit);
}

class HabitProvider extends ChangeNotifier implements IHabitProvider {
  List<Habit> _habits = [];
  HabitStatus _status = HabitStatus.initial;

  @override
  List<Habit> get habits => _habits;

  @override
  HabitStatus get status => _status;

  @override
  void habitStarted() {
    if (_habits.isEmpty) {
      _status = HabitStatus.initial;
    } else {
      _status = HabitStatus.success;
    }
    notifyListeners();
  }

  @override
  void addHabit(Habit habit) {
    try {
      _habits = [habit, ..._habits];
      _status = HabitStatus.success;
    } catch (e) {
      _status = HabitStatus.error;
    }
    notifyListeners();
  }

  @override
  void removeHabit(Habit habit) {
    try {
      _habits.remove(habit);
      _status = HabitStatus.success;
      if (_habits.isEmpty) {
        _status = HabitStatus.initial;
      }
    } catch (e) {
      _status = HabitStatus.error;
    }
    notifyListeners();
  }

  @override
  void toggleHabit(int index) {
    try {
      _habits[index].isDone = !_habits[index].isDone;
      _status = HabitStatus.success;
    } catch (e) {
      _status = HabitStatus.error;
    }
    notifyListeners();
  }

  @override
  void editHabit(int index, Habit updatedHabit) {
    try {
      List<Habit>? updatedHabits = List.from(_habits);
      if (index >= 0 && index < updatedHabits.length) {
        updatedHabits[index] = updatedHabit;
        _habits = updatedHabits;
        _status = HabitStatus.success;
      } else {
        _status = HabitStatus.error;
      }
    } catch (e) {
      _status = HabitStatus.error;
    }
    notifyListeners();
  }

  @override
  void reorderHabits(int oldIndex, int newIndex, Habit movedHabit) {
    try {
      List<Habit> updatedHabits = List.from(_habits);
      // Remove the habit from its old position
      updatedHabits.remove(movedHabit);
      // Insert the habit into the new position
      if (newIndex < updatedHabits.length) {
        updatedHabits.insert(newIndex, movedHabit);
      } else {
        updatedHabits.add(movedHabit);
      }
      _habits = updatedHabits;
      _status = HabitStatus.success;
    } catch (e) {
      _status = HabitStatus.error;
    }
    notifyListeners();
  }
}
