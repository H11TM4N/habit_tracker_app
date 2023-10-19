// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:habit_tracker_app/data/models/habit_completion.dart';

class Habit {
  final int id;
  final String title;
  final String subtitle;
  bool isDone;
  List<HabitCompletion> completions;

  Habit({
    this.id = 0,
    this.title = '',
    this.subtitle = '',
    this.isDone = false,
    this.completions = const [],
  });

  Habit copyWith({
    int? id,
    String? title,
    String? subtitle,
    bool? isDone,
    List<HabitCompletion>? completions,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isDone: isDone ?? this.isDone,
      completions: completions ?? this.completions,
    );
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'isDone': isDone,
      'completions': completions.map((x) => x.toMap()).toList(),
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      isDone: map['isDone'] as bool,
      completions: List<HabitCompletion>.from((map['completions'] as List<int>).map<HabitCompletion>((x) => HabitCompletion.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) => Habit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Habit(id: $id, title: $title, subtitle: $subtitle, isDone: $isDone, completions: $completions)';
  }

  @override
  bool operator ==(covariant Habit other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.isDone == isDone &&
      listEquals(other.completions, completions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      isDone.hashCode ^
      completions.hashCode;
  }
}
