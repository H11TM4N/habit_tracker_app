import 'package:habit_tracker_app/models/habit.dart';

Map<DateTime, int> calculateDailyCompletion(List<Habit> habits) {
  Map<DateTime, int> dailyCompletion = {};

  for (Habit habit in habits) {
    for (DateTime completionDate in habit.completionDates) {
      DateTime date = DateTime(
          completionDate.year, completionDate.month, completionDate.day);
      dailyCompletion.update(date, (value) => value + 1, ifAbsent: () => 1);
    }
  }

  return dailyCompletion;
}
