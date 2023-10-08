import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/widgets/custom_textfields/textfield.dart';

class AddHabitScreen extends ConsumerWidget {
  final Habit habitData;

  const AddHabitScreen({
    super.key,
    required this.habitData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitController = ref.watch(habitProvider.notifier);
    final habitName = habitData.title;
    final question = habitData.question;
    final isEditing = habitData.isEditing;

    TextEditingController habitNameController = TextEditingController();
    TextEditingController questionController = TextEditingController();

    TextEditingController newHabitNameController =
        TextEditingController(text: habitName);
    TextEditingController newQuestionController =
        TextEditingController(text: question);

    return Scaffold(
      appBar: AppBar(
        title:
            isEditing ? const Text('Edit Habit') : const Text('Create Habit'),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (isEditing) {
                Navigator.of(context).popUntil((route) => route.isFirst);
                habitController.editHabit(
                  habitData.id,
                  newHabitNameController.text,
                  newQuestionController.text,
                );
                habitNameController.clear();
                questionController.clear();
              } else {
                Navigator.pop(context);
                habitController.addHabit(
                  habitNameController.text,
                  questionController.text,
                  true,
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
            controller:
                isEditing ? newHabitNameController : habitNameController,
            hintText: 'Exercise',
          ),
          KtextField(
              title: 'Question',
              controller:
                  isEditing ? newQuestionController : questionController,
              hintText: 'Did you excersise today?'),
        ],
      ),
    );
  }
}
