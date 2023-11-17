// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:habit_tracker_app/constants/enums.dart';
import 'package:habit_tracker_app/data/models/habit_model.dart';

class HabitState extends Equatable {
  final List<Habit> habits;
  final HabitStatus status;

  const HabitState({
    required this.habits,
    required this.status,
  });

  HabitState.empty()
      : habits = <Habit>[],
        status = HabitStatus.initial;

  HabitState copyWith({
    List<Habit>? habits,
    HabitStatus? status,
  }) {
    return HabitState(
      habits: habits ?? this.habits,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [habits, status];

  Map<String, dynamic> toMap() {
    return {
      'habits': habits.map((habit) => habit.toMap()).toList(),
      'status': status.toString(), // Store status as a string
    };
  }

  factory HabitState.fromMap(Map<String, dynamic> map) {
    final List<dynamic> habitMaps = map['habits'] as List<dynamic>;
    final List<Habit> habits = habitMaps.map((habitMap) {
      return Habit.fromMap(habitMap as Map<String, dynamic>);
    }).toList();

    return HabitState(
      habits: habits,
      status: HabitStatus.values.firstWhere(
          (status) => status.toString() == map['status'],
          orElse: () => HabitStatus.initial),
    );
  }
}
