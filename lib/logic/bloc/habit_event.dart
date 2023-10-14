part of 'habit_bloc.dart';

abstract class HabitEvent extends Equatable {
  const HabitEvent();

  @override
  List<Object?> get props => [];
}

class HabitStartedEvent extends HabitEvent {}

class AddHabitEvent extends HabitEvent {
  final Habit habit;

  const AddHabitEvent({required this.habit});

  @override
  List<Object?> get props => [habit];
}

class RemoveHabitEvent extends HabitEvent {
  final Habit habit;

  const RemoveHabitEvent({required this.habit});

  @override
  List<Object?> get props => [habit];
}

class EditHabitEvent extends HabitEvent {
  final int index;
  final Habit updatedHabit;

  const EditHabitEvent(this.index, this.updatedHabit);

  @override
  List<Object> get props => [index, updatedHabit];
}

class ToggleHabitEvent extends HabitEvent {
  final int index;

  const ToggleHabitEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class ReorderHabitsEvent extends HabitEvent {
  final int newIndex;
  final Habit movedHabit;

  const ReorderHabitsEvent(this.newIndex, this.movedHabit);

  @override
  List<Object> get props => [newIndex, movedHabit];
}