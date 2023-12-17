import 'package:habit_tracker_app/utils/date_formatter.dart';

// class Habit {
//   final String id;
//   final String title;
//   final String description;
//   final DateTime createdAt;
//   List<DateTime> completionDates;

//   Habit({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.createdAt,
//     required this.completionDates,
//   });

//   Habit.empty()
//       : id = '',
//         title = '',
//         description = '',
//         createdAt = dateFormatter(DateTime.now()),
//         completionDates = [];
// }

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

  Habit({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.completionDates,
  });

  Habit.empty()
      : id = '',
        title = '',
        description = '',
        createdAt = dateFormatter(DateTime.now()),
        completionDates = [];
}
