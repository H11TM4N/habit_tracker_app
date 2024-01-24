import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/common/common.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/models/habit_event.dart';
import 'package:habit_tracker_app/models/habit_state.dart';
import 'package:table_calendar/table_calendar.dart';

final habitProvider = StateNotifierProvider<HabitNotifier, HabitState>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<HabitState> {
  HabitNotifier()
      : super(
          HabitState(
              habits: [],
              habitEvent: HabitEvent(
                events: {},
                focusedDay: DateTime.now(),
                selectedDay: DateTime.now(),
                selectedEvents: [],
              )),
        ) {
    state = state.copyWith(
      habits: habitBox.values.toList(),
      habitEvent: state.habitEvent.copyWith(
        selectedDay: state.habitEvent.focusedDay,
        selectedEvents: getEventForDay(state.habitEvent.selectedDay),
      ),
    );
  }

  void addHabit(Habit habit) {
    habitBox.add(habit);
    //* add event
    state.habitEvent.events.addAll({
      state.habitEvent.selectedDay: [...state.habitEvent.selectedEvents, habit]
    });
    state = state.copyWith(
      habits: habitBox.values.toList(),
      habitEvent: state.habitEvent.copyWith(
        selectedEvents: getEventForDay(state.habitEvent.selectedDay),
      ),
    );
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
        for (final entry in state.habitEvent.events.entries)
          if (entry.value.contains(removedHabit))
            entry.key: entry.value.where((h) => h != removedHabit).toList()
      };

      // Update the state with the new habits and events
      state = state.copyWith(
        habits: habitBox.values.toList(),
        habitEvent: state.habitEvent.copyWith(events: updatedEvents),
      );
    }
  }

  void clearHabits() {
    for (int i = state.habits.length - 1; i >= 0; i--) {
      habitBox.deleteAt(i);
    }
    state = state.copyWith(
      habits: [],
      habitEvent: state.habitEvent.copyWith(
        events: {},
        selectedEvents: [],
      ),
    );
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

  //* events
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(state.habitEvent.selectedDay, selectedDay)) {
      state = state.copyWith(
        habitEvent: state.habitEvent.copyWith(
          selectedDay: selectedDay,
          focusedDay: focusedDay,
          selectedEvents: getEventForDay(state.habitEvent.selectedDay),
        ),
      );
    }
  }

  List<Habit> getEventForDay(DateTime day) {
    return state.habitEvent.events[day] ?? [];
  }

  void onPageChanged(DateTime focusedDay) {
    state.copyWith(
      habitEvent: state.habitEvent.copyWith(
        focusedDay: focusedDay,
      ),
    );
  }
}
