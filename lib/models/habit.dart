// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Habit copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    List<DateTime>? completionDates,
    bool? isCompleted,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      completionDates: completionDates ?? this.completionDates,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
