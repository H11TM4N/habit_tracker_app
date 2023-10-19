import 'package:habit_tracker_app/logic/habit_completion_bloc/habit_completion_event.dart';
import 'package:habit_tracker_app/logic/habit_completion_bloc/habit_completion_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class HabitCompletionBloc
    extends HydratedBloc<HabitCompletionEvent, HabitCompletionState> {
  HabitCompletionBloc() : super(const HabitCompletionState()) {
    on<AddHabitCompletedEvent>((event, emit) {
      final updatedCompletions = Map.of(state.completions);
      if (!updatedCompletions.containsKey(event.date)) {
        updatedCompletions[event.date] = [event.completion];
      } else {
        updatedCompletions[event.date]!.add(event.completion);
      }
      emit(
        state.copyWith(completions: updatedCompletions),
      );
    });
  }

  @override
  HabitCompletionState? fromJson(Map<String, dynamic> json) {
    return HabitCompletionState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(HabitCompletionState state) {
    return state.toMap();
  }
}
