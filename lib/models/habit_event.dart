// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:habit_tracker_app/models/habit.dart';

class HabitEvent {
  final Map<DateTime, List<Habit>> events;
  final DateTime focusedDay;
  final DateTime selectedDay;
  final List<Habit> selectedEvents;

  HabitEvent({
    required this.events,
    required this.focusedDay,
    required this.selectedDay,
    required this.selectedEvents,
  });

  HabitEvent copyWith({
    Map<DateTime, List<Habit>>? events,
    DateTime? focusedDay,
    DateTime? selectedDay,
    List<Habit>? selectedEvents,
  }) {
    return HabitEvent(
      events: events ?? this.events,
      focusedDay: focusedDay ?? this.focusedDay,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedEvents: selectedEvents ?? this.selectedEvents,
    );
  }
}
