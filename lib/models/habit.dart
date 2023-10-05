class Habit {
  String title;
  String question;
  bool isDone;

  Habit({
    required this.title,
    required this.isDone,
    required this.question,
  });
}

class HabitList {
  List<Habit> habits;

  HabitList({required this.habits});
}