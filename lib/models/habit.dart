// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Habit {
  int id;
  String title;
  String question;
  bool isDone;
  bool isEditing;

  Habit({
    required this.id,
    required this.title,
    required this.question,
    required this.isDone,
    required this.isEditing,
  });

  Habit copyWith({
    int? id,
    String? title,
    String? question,
    bool? isDone,
    bool? isEditing,
  }) {
    return Habit(
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

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'] as int,
      title: map['title'] as String,
      question: map['question'] as String,
      isDone: map['isDone'] as bool,
      isEditing: map['isEditing'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) => Habit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Habit(id: $id, title: $title, question: $question, isDone: $isDone, isEditing: $isEditing)';
  }

  @override
  bool operator ==(covariant Habit other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
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
}
