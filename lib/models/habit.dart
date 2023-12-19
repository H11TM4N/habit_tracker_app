import 'package:habit_tracker_app/common/common.dart';
import 'package:uuid/uuid.dart';
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
  bool isComleted;

  Habit({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.isComleted,
    required this.completionDates,
  });

  Habit.newHabit({
    required this.title,
    required this.description,
  })  : id = const Uuid().v4(),
        createdAt = dateFormatter(DateTime.now()),
        isComleted = false,
        completionDates = [];
}
