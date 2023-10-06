import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/widgets/custom_textfields/textfield.dart';

class AddHabitScreen extends ConsumerWidget {
  final Habit habitData;
  final int? habitIndex;

  const AddHabitScreen({
    super.key,
    required this.habitData,
    this.habitIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController habitNameController = TextEditingController();
    TextEditingController questionController = TextEditingController();
    final habitName = habitData.title;
    final question = habitData.question;
    final isEditing = habitData.isEditing;

    return Scaffold(
      appBar: AppBar(
        title:
            isEditing ? const Text('Edit Habit') : const Text('Create Habit'),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (isEditing) {
                Navigator.of(context).popUntil((route) => route.isFirst);
                ref.read(habitProvider.notifier).editHabit(
                      habitIndex!,
                      habitNameController.text,
                      questionController.text,
                    );
                habitNameController.clear();
                questionController.clear();
              } else {
                Navigator.pop(context);
                ref.watch(habitProvider.notifier).addHabit(
                      habitNameController.text,
                      questionController.text,
                      false,
                    );
                habitNameController.clear();
                questionController.clear();
              }
            },
            child: isEditing ? const Text('Save') : const Text('Add'),
          ),
        ],
      ),
      body: Column(
        children: [
          KtextField(
            title: 'Name',
            controller: isEditing
                ? TextEditingController(text: habitName)
                : habitNameController,
            hintText: 'Exercise',
          ),
          KtextField(
              title: 'Question',
              controller: isEditing
                  ? TextEditingController(text: question)
                  : questionController,
              hintText: 'Did you excersise today?'),
        ],
      ),
    );
  }
}
