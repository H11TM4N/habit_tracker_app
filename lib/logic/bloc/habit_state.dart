// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:habit_tracker_app/data/constants/enums.dart';
import 'package:habit_tracker_app/data/models/habit_model.dart';

class HabitState extends Equatable {
  final List<Habit> habits;
  final HabitStatus status;

  const HabitState({
    this.habits = const <Habit>[],
    this.status = HabitStatus.initial,
  });

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
}
