// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Habit {
  final int id;
  final String title;
  final String note;
  bool isDone;

  Habit({
    this.id = 0,
    this.title = '',
    this.note = 'optional',
    this.isDone = false,
  });

  Habit copyWith({
    int? id,
    String? title,
    String? note,
    bool? isDone,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'note': note,
      'isDone': isDone,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'] as int,
      title: map['title'] as String,
      note: map['note'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) =>
      Habit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Habit(id: $id, title: $title, note: $note, isDone: $isDone)';
  }

  @override
  bool operator ==(covariant Habit other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.note == note &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ note.hashCode ^ isDone.hashCode;
  }
}
