import 'dart:async';
import 'package:habit_tracker_app/data/constants/enums.dart';
import 'package:habit_tracker_app/data/models/habit_model.dart';
import 'package:habit_tracker_app/logic/bloc/habit_event.dart';
import 'package:habit_tracker_app/logic/bloc/habit_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc() : super(const HabitState()) {
    on<HabitStartedEvent>(_habitStarted);

    on<AddHabitEvent>(_addHabit);

    on<RemoveHabitEvent>(_removeHabit);

    on<ToggleHabitEvent>(_toggleHabit);

    on<EditHabitEvent>(_editHabit);

    on<ReorderHabitsEvent>(_reorderHabit);
  }

  FutureOr<void> _habitStarted(
      HabitStartedEvent event, Emitter<HabitState> emit) {
    if (state.status == HabitStatus.success) {
      emit(state.copyWith(
        habits: state.habits,
        status: HabitStatus.success,
      ));
    }
  }

  FutureOr<void> _addHabit(AddHabitEvent event, Emitter<HabitState> emit) {
    emit(
      state.copyWith(status: HabitStatus.added),
    );
    try {
      List<Habit> temp = [];
      temp.addAll(state.habits);
      temp.insert(0, event.habit);
      emit(state.copyWith(
        habits: temp,
        status: HabitStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HabitStatus.error,
      ));
    }
  }

  FutureOr<void> _removeHabit(
      RemoveHabitEvent event, Emitter<HabitState> emit) {
    emit(
      state.copyWith(status: HabitStatus.removed),
    );
    try {
      if (state.habits.isEmpty) {
        emit(const HabitState(status: HabitStatus.initial));
      }
      state.habits.remove(event.habit);
      emit(state.copyWith(
        habits: state.habits,
        status: HabitStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HabitStatus.error,
      ));
    }
  }

  FutureOr<void> _toggleHabit(
      ToggleHabitEvent event, Emitter<HabitState> emit) {
    emit(
      state.copyWith(status: HabitStatus.loading),
    );
    try {
      state.habits[event.index].isDone = !state.habits[event.index].isDone;
      emit(state.copyWith(
        habits: state.habits,
        status: HabitStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HabitStatus.error,
      ));
    }
  }

  FutureOr<void> _editHabit(EditHabitEvent event, Emitter<HabitState> emit) {
    emit(
      state.copyWith(status: HabitStatus.loading),
    );
    try {
      List<Habit>? updatedHabits = List.from(state.habits);
      if (event.index >= 0 && event.index < updatedHabits.length) {
        updatedHabits[event.index] = event.updatedHabit;
        emit(state.copyWith(
          habits: updatedHabits,
          status: HabitStatus.success,
        ));
      } else {
        emit(state.copyWith(
          status: HabitStatus.error,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: HabitStatus.error,
      ));
    }
  }

  FutureOr<void> _reorderHabit(
      ReorderHabitsEvent event, Emitter<HabitState> emit) {
    emit(
      state.copyWith(status: HabitStatus.loading),
    );
    try {
      List<Habit> updatedHabits = List.from(state.habits);
      // Remove the habit from its old position
      updatedHabits.remove(event.movedHabit);
      // Insert the habit into the new position
      if (event.newIndex < updatedHabits.length) {
        updatedHabits.insert(event.newIndex, event.movedHabit);
      } else {
        updatedHabits.add(event.movedHabit);
      }
      emit(state.copyWith(
        habits: updatedHabits,
        status: HabitStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HabitStatus.error,
      ));
    }
  }
}
