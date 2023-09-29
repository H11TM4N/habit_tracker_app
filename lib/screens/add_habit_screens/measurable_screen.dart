import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/create_habit_provider.dart';
import '../../providers/habit_provider.dart';
import '../../widgets/custom_textfields/textfield.dart';

class MeasurableScreen extends StatelessWidget {
  const MeasurableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    CreateHabitProvider createHabitProvider = Provider.of<CreateHabitProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create habit'),
        actions: [
          ElevatedButton(
              onPressed: () {
                habitProvider.addHabit(context, createHabitProvider.nameController.text, );
              },
              child: const Text('SAVE'))
        ],
      ),
      body: Column(
        children: [
          CustomTextField(
            title: 'Name',
            hintText: 'Run',
            controller: createHabitProvider.nameController,
          ),
          CustomTextField(
            title: 'Question',
            hintText: 'How many miles did you run today?',
            controller: createHabitProvider.questionController,
          ),
          CustomTextField(
            title: 'Unit',
            hintText: 'miles',
            controller: createHabitProvider.unitController,
          ),
          CustomTextField(
            title: 'Target',
            hintText: '15',
            controller: createHabitProvider.targetController,
          ),
        ],
      ),
    );
  }
}
