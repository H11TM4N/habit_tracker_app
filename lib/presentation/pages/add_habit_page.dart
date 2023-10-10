import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/cubits/habit_cubit.dart';
import 'package:habit_tracker_app/logic/cubits/habit_state.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_textfields/textfield.dart';

class AddHabitPage extends StatelessWidget {
  final HabitState habitData;

  const AddHabitPage({
    super.key,
    required this.habitData,
  });

  @override
  Widget build(BuildContext context) {
    final habitCubit = context.watch<HabitCubit>();

    // // Access properties or call methods on the cubit.
    // final habits = habitCubit.state;

    TextEditingController habitNameController = TextEditingController();
    TextEditingController questionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Create Habit'),
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
            child: const Text('Add'),
          ),
        ],
      ),
      body: Column(
        children: [
          KtextField(
            title: 'Name',
            controller: habitNameController,
            hintText: 'Exercise',
          ),
          KtextField(
              title: 'Question',
              controller: questionController,
              hintText: 'Did you excersise today?'),
        ],
      ),
    );
  }
}
