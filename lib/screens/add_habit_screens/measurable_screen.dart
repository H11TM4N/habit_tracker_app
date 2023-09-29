import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/habit_provider.dart';
import '../../widgets/custom_textfields/textfield.dart';

class MeasurableScreen extends StatelessWidget {
  const MeasurableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);

    final nameController = TextEditingController();
    final questionController = TextEditingController();
    final unitController = TextEditingController();
    final targetController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create habit'),
        actions: [
          ElevatedButton(
              onPressed: () {
                habitProvider.addHabit(context, nameController.text, );
              },
              child: const Text('SAVE'))
        ],
      ),
      body: Column(
        children: [
          CustomTextField(
            title: 'Name',
            hintText: 'Run',
            controller: nameController,
          ),
          CustomTextField(
            title: 'Question',
            hintText: 'How many miles did you run today?',
            controller: questionController,
          ),
          CustomTextField(
            title: 'Unit',
            hintText: 'miles',
            controller: unitController,
          ),
          CustomTextField(
            title: 'Target',
            hintText: '15',
            controller: targetController,
          ),
        ],
      ),
    );
  }
}