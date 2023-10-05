import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitOverview extends ConsumerWidget {
  final String habitName;

  const HabitOverview({
    super.key,
    required this.habitName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(habitName),
      ),
    );
  }
}
