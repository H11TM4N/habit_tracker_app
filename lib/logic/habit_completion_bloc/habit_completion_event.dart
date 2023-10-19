import 'package:equatable/equatable.dart';
import 'package:habit_tracker_app/data/models/habit_completion.dart';

class HabitCompletionEvent extends Equatable {
  const HabitCompletionEvent();

  @override
  List<Object?> get props => [];
}

class AddHabitCompletedEvent extends HabitCompletionEvent {
  final DateTime date;
  final HabitCompletion completion;

   const AddHabitCompletedEvent({
    required this.date,
    required this.completion,
  });

  @override
  List<Object?> get props => [date, completion];
}
