// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:habit_tracker_app/data/models/habit_completion.dart';

class HabitCompletionState extends Equatable {
  final Map<DateTime, List<HabitCompletion>> completions;

  const HabitCompletionState({
    this.completions = const <DateTime, List<HabitCompletion>>{},
  });

  @override
  List<Object?> get props => [completions];

  HabitCompletionState copyWith({
    Map<DateTime, List<HabitCompletion>>? completions,
  }) {
    return HabitCompletionState(
      completions: completions ?? this.completions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'completions': completions,
    };
  }

  factory HabitCompletionState.fromMap(Map<String, dynamic> map) {
    return HabitCompletionState(
      completions: Map<DateTime, List<HabitCompletion>>.from(
        (map['completions'] as Map<DateTime, List<HabitCompletion>>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitCompletionState.fromJson(String source) =>
      HabitCompletionState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
