import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/logic/cubits/habit_cubit.dart';
import 'package:habit_tracker_app/logic/cubits/habit_state.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_textfields/textfield.dart';

class AddHabitScreen extends ConsumerWidget {
  final HabitState habitData;

  const AddHabitScreen({
    super.key,
    required this.habitData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HabitCubit habitCubit = BlocProvider.of<HabitCubit>(context);

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
              Navigator.pop(context);
              habitCubit.addHabit(
                habitNameController.text,
                questionController.text,
                true,
              );
              habitNameController.clear();
              questionController.clear();
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
