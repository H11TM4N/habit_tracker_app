// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'habit_bloc.dart';

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
