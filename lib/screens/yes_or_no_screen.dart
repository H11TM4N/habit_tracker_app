import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../providers/habit_provider.dart';

class YesOrNoScreen extends StatelessWidget {
  const YesOrNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create habit'),
        actions: [ElevatedButton(onPressed: () {}, child: const Text('SAVE'))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomTextField(
              title: 'Name',
              controller: habitProvider.textController,
            )
          ],
        ),
      ),
    );
  }
}
