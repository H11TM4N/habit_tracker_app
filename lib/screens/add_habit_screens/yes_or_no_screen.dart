import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/widgets/custom_textfields/textfield.dart';
import 'package:provider/provider.dart';

import '../../providers/create_habit_provider.dart';


class YesOrNoScreen extends StatefulWidget {
  const YesOrNoScreen({super.key});

  @override
  State<YesOrNoScreen> createState() => _YesOrNoScreenState();
}

class _YesOrNoScreenState extends State<YesOrNoScreen> {
  @override
  Widget build(BuildContext context) {
    CreateHabitProvider createHabitProvider = Provider.of<CreateHabitProvider>(context);
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Create habit'),
        actions: [
          ElevatedButton(
              onPressed: () {
                habitProvider.addHabit(context, createHabitProvider.nameController.text);
              },
              child: const Text('SAVE'))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  title: 'Name',
                  hintText: 'Exercise',
                  controller: createHabitProvider.nameController,
                ),
              ),
              GestureDetector(
                onTap: () {
                  createHabitProvider.showColorSelectionDialog(context);
                },
                child: SizedBox(
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: createHabitProvider.habitTextColor ?? Colors.black12,
                      title: const Center(
                        child: Text(
                          'Color',
                          style: TextStyle(
                            color: Colors.white, // Set a default text color
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomTextField(
            title: 'Question',
            hintText: 'Did you exercise today?',
            controller: createHabitProvider.questionController,
          ),
        ],
      ),
    );
  }
}
