import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/cubits/habit_cubit.dart';
import 'package:habit_tracker_app/logic/cubits/habit_state.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_textfields/textfield.dart';

class EditHabitPage extends StatelessWidget {
  final HabitState habitData;

  const EditHabitPage({
    super.key,
    required this.habitData,
  });

  @override
  Widget build(BuildContext context) {
    final habitCubit = context.watch<HabitCubit>();

    // // Access properties or call methods on the cubit.
    // final habits = habitCubit.state;

    final habitName = habitData.title;
    final question = habitData.question;

  

    TextEditingController newHabitNameController =
        TextEditingController(text: habitName);
    TextEditingController newQuestionController =
        TextEditingController(text: question);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Habit'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              habitCubit.editHabit(
                habitData.id,
                newHabitNameController.text,
                newQuestionController.text,
              );
              newHabitNameController.clear();
              newQuestionController.clear();
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: Column(
        children: [
          KtextField(
            title: 'Name',
            controller: newHabitNameController,
            hintText: 'Exercise',
          ),
          KtextField(
              title: 'Question',
              controller: newQuestionController,
              hintText: 'Did you excersise today?'),
        ],
      ),
    );
  }
}
