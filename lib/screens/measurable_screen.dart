import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';
import '../widgets/textfield.dart';

class MeasurableScreen extends StatelessWidget {
  const MeasurableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create habit'),
        actions: [ElevatedButton(onPressed: () {}, child: const Text('SAVE'))],
      ),
      body: Column(
        children: [
          CustomTextField(
            title: 'Name',
            hintText: 'Run',
            controller: habitProvider.textController,
          ),
          CustomTextField(
            title: 'Question',
            hintText: 'How many miles did you run today?',
            controller: habitProvider.textController,
          ),
          CustomTextField(
            title: 'Unit',
            hintText: 'miles',
            controller: habitProvider.textController,
          ),
          CustomTextField(
            title: 'Target',
            hintText: '15',
            controller: habitProvider.textController,
          ),
        ],
      ),
    );
  }
}
