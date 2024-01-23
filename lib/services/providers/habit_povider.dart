import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/models/habit_state.dart';

final habitProvider = StateNotifierProvider<HabitNotifier, HabitState>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<HabitState> {
  HabitNotifier() : super(HabitState(habits: [], events: {})) {
    state = state.copyWith(
      habits: habitBox.values.toList(),
    );
  }

  void addHabit(Habit habit) {
    
    habitBox.add(habit);
    state = state.copyWith(
      habits: habitBox.values.toList(),
      events: {
        ...state.events,
        dateFormatter(DateTime.now()): [...state.habits, habit],
      },
    );
    print(state.events);
  }

  void removeHabit(String id) {
    final int habitIndex =
        state.habits.indexWhere((h) => h.id.compareTo(id) == 0);

    if (habitIndex > -1) {
      // Get the habit being removed
      final Habit removedHabit = state.habits[habitIndex];

      // Remove the habit from habitBox
      habitBox.deleteAt(habitIndex);

      // Remove the corresponding event from the events map
      final Map<DateTime, List<Habit>> updatedEvents = {
        for (final entry in state.events.entries)
          if (entry.value.contains(removedHabit))
            entry.key: entry.value.where((h) => h != removedHabit).toList()
      };

      // Update the state with the new habits and events
      state = state.copyWith(
        habits: habitBox.values.toList(),
        events: updatedEvents,
      );
      print(state.events);
    }
  }

  void clearHabits() {
    for (int i = state.habits.length - 1; i >= 0; i--) {
      habitBox.deleteAt(i);
    }
    state = state.copyWith(habits: [], events: {});
  }

  void editHabit(Habit habit) {
    int index = state.habits.indexWhere((h) => h.id.compareTo(habit.id) == 0);
    if (index > -1) {
      habitBox.putAt(index, habit);
      state = state.copyWith(
        habits: habitBox.values.toList(),
      );
    }
  }

  void toggleCompletion(Habit habit) {
    int index = state.habits.indexWhere((h) => h.id.compareTo(habit.id) == 0);

    DateTime currentDate = dateFormatter(DateTime.now());

    if (habit.completionStatus[currentDate] == null) {
      habit.completionStatus[currentDate] = true;
    } else {
      habit.completionStatus[currentDate] =
          !habit.completionStatus[currentDate]!;
    }
    // print('${habit.title}: ${habit.completionStatus}');
    habitBox.putAt(index, habit);
    state = state.copyWith(
      habits: habitBox.values.toList(),
    );
  }
}
