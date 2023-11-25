import 'package:flutter/material.dart';
import 'package:habit_repository/habit_repository.dart';
import 'package:provider/provider.dart';
import '../../logic/providers/habit_provider.dart';
import '../widgets/widgets.dart';

class CreateHabitPage extends StatefulWidget {
  const CreateHabitPage({super.key});

  @override
  State<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _questionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            KtextField(
              title: 'Habit title',
              controller: _titleController,
              hintText: 'e.g. Excercise',
            ),
            KtextField(
              title: 'Question',
              controller: _questionController,
              hintText: 'e.g. Did you excercise today?',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kMaterialButton(() => Navigator.pop(context), 'Cancel'),
                kMaterialButton(() {
                  context.read<HabitProvider>().addHabit(Habit(
                        title: _titleController.text,
                        subtitle: _questionController.text,
                      ));
                  _titleController.clear();
                  _questionController.clear();
                  Navigator.pop(context);
                }, 'Add Habit'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
