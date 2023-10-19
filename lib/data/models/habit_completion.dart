// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HabitCompletion {
  final int habitId;
  final bool isCompleted;

  HabitCompletion({
    required this.habitId,
    required this.isCompleted,
  });

  HabitCompletion copyWith({
    DateTime? date,
    int? habitId,
    bool? isCompleted,
  }) {
    return HabitCompletion(
      habitId: habitId ?? this.habitId,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'habitId': habitId,
      'isCompleted': isCompleted,
    };
  }

  factory HabitCompletion.fromMap(Map<String, dynamic> map) {
    return HabitCompletion(
      habitId: map['habitId'] as int,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitCompletion.fromJson(String source) => HabitCompletion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HabitCompletion(habitId: $habitId, isCompleted: $isCompleted)';

  @override
  bool operator ==(covariant HabitCompletion other) {
    if (identical(this, other)) return true;
  
    return 
      other.habitId == habitId &&
      other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => habitId.hashCode ^ isCompleted.hashCode;
}
