import 'package:flutter/material.dart';
import 'package:habit_repository/habit_repository.dart';
import 'package:provider/provider.dart';
import '../../common/common.dart';
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
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.secondary,
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
              title: 'Additional notes',
              controller: _questionController,
              hintText: 'Optional',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kMaterialButton(() => Navigator.pop(context), 'Cancel'),
                kMaterialButton(() {
                  context.read<HabitProvider>().addHabit(Habit(
                        title: _titleController.text,
                        note: _questionController.text,
                      ));
                  _titleController.clear();
                  _questionController.clear();
                  showSnackBar(context, 'Habit added');
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
