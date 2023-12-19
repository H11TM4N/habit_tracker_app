import 'package:hive/hive.dart';
part 'habit.g.dart';

@HiveType(typeId: 1)
class Habit {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  List<DateTime> completionDates;
  @HiveField(5)
  bool isCompleted;

  Habit({
    this.id = '',
    this.title = '',
    this.description = '',
    required this.createdAt,
    required this.isCompleted,
    this.completionDates = const [],
  });
}
