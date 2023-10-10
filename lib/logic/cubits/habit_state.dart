// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HabitState with EquatableMixin {
  int id;
  String title;
  String question;
  bool isDone;
  bool isEditing;

  HabitState({
    required this.id,
    required this.title,
    required this.question,
    required this.isDone,
    required this.isEditing,
  });

  HabitState copyWith({
    int? id,
    String? title,
    String? question,
    bool? isDone,
    bool? isEditing,
  }) {
    return HabitState(
      id: id ?? this.id,
      title: title ?? this.title,
      question: question ?? this.question,
      isDone: isDone ?? this.isDone,
      isEditing: isEditing ?? this.isEditing,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'question': question,
      'isDone': isDone,
      'isEditing': isEditing,
    };
  }

  factory HabitState.fromMap(Map<String, dynamic> map) {
    return HabitState(
      id: map['id'] as int,
      title: map['title'] as String,
      question: map['question'] as String,
      isDone: map['isDone'] as bool,
      isEditing: map['isEditing'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitState.fromJson(String source) =>
      HabitState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HabitState(id: $id, title: $title, question: $question, isDone: $isDone, isEditing: $isEditing)';
  }

  @override
  bool operator ==(covariant HabitState other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.question == question &&
        other.isDone == isDone &&
        other.isEditing == isEditing;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        question.hashCode ^
        isDone.hashCode ^
        isEditing.hashCode;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        question,
        isDone,
        isEditing,
      ];
}
