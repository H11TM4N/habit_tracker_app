import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/services/providers/habit_povider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditHabitScreen extends HookConsumerWidget {
  final Habit habit;
  const EditHabitScreen({
    super.key,
    required this.habit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: habit.title);
    final descriptionController =
        useTextEditingController(text: habit.description);
    final notesController = useTextEditingController(text: habit.notes);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            const CreateHabitHeader(isEditing: true),
            const CustomLabelText(
              labelText: 'Title',
            ),
            CustomTextField(
              controller: titleController,
              keyboardType: TextInputType.name,
              maxLength: 30,
              hintText: 'Enter habit title',
            ),
            const CustomLabelText(
              labelText: 'Description',
            ),
            CustomTextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              hintText: 'Optional',
            ),
            const CustomLabelText(
              labelText: 'Additional Notes',
            ),
            CustomTextField(
              controller: notesController,
              keyboardType: TextInputType.multiline,
              hintText: 'Optional',
            ),
            const SizedBox(height: 20),
            SaveButton(
              isEditing: true,
              onTap: () {
                ref.watch(habitProvider.notifier).editHabit(
                      habit.copyWith(
                        title: titleController.text.trim(),
                        description: descriptionController.text.trim(),
                        notes: notesController.text.trim(),
                      ),
                    );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
