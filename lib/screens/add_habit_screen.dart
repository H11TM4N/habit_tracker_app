import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/widgets/custom_textfields/textfield.dart';

class AddHabitScreen extends ConsumerWidget {
  const AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Habit'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref.watch(habitProvider.notifier).addHabit();
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: Column(
        children: [
          KtextField(
            title: 'Name',
            controller: ref.read(habitProvider.notifier).habitNameController,
            hintText: 'Exercise',
          ),
          KtextField(
              title: 'Question',
              controller: ref.read(habitProvider.notifier).questionController,
              hintText: 'Did you excersise today?'),
        ],
      ),
    );
  }
}
