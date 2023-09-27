import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../providers/habit_provider.dart';

class YesOrNoScreen extends StatelessWidget {
  const YesOrNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    final nameController = TextEditingController();
    final questionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create habit'),
        actions: [
          ElevatedButton(
              onPressed: () {
                habitProvider.saveButtonOnpressed(
                  context,
                  nameController.text,
                );
              },
              child: const Text('SAVE'))
        ],
      ),
      body: Column(
        children: [
          CustomTextField(
            title: 'Name',
            hintText: 'Exercise',
            controller: nameController,
          ),
          CustomTextField(
            title: 'Question',
            hintText: 'Did you exercise today?',
            controller: questionController,
          ),
        ],
      ),
    );
  }
}
