// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:habit_tracker_app/models/habit.dart';

class HabitState {
  final List<Habit> habits;
  final Map<DateTime, List<Habit>> events;

  HabitState({
    required this.habits,
    required this.events,
  });

  HabitState copyWith({
    List<Habit>? habits,
    Map<DateTime, List<Habit>>? events,
  }) {
    return HabitState(
      habits: habits ?? this.habits,
      events: events ?? this.events,
    );
  }
}
