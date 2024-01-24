// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/models/habit_event.dart';

class HabitState {
  final List<Habit> habits;
  final HabitEvent habitEvent;

  HabitState({
    required this.habits,
    required this.habitEvent,
  });

  HabitState copyWith({
    List<Habit>? habits,
    HabitEvent? habitEvent,
  }) {
    return HabitState(
      habits: habits ?? this.habits,
      habitEvent: habitEvent ?? this.habitEvent,
    );
  }
}
