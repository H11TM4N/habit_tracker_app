// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HabitState with EquatableMixin {
  int id;
  String title;
  String question;
  bool isDone;
  List<DateTime> completionDates;

  HabitState({
    required this.id,
    required this.title,
    required this.question,
    required this.isDone,
    List<DateTime>? completionDates,

  }): completionDates = completionDates ?? <DateTime>[];

  @override
  List<Object> get props => [id, title, question, isDone];

  @override
  bool get stringify => true;

  HabitState copyWith({
    int? id,
    String? title,
    String? question,
    bool? isDone,
  }) {
    return HabitState(
      id: id ?? this.id,
      title: title ?? this.title,
      question: question ?? this.question,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'question': question,
      'isDone': isDone,
    };
  }

  factory HabitState.fromMap(Map<String, dynamic> map) {
    return HabitState(
      id: map['id'] as int,
      title: map['title'] as String,
      question: map['question'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitState.fromJson(String source) =>
      HabitState.fromMap(json.decode(source) as Map<String, dynamic>);
}
