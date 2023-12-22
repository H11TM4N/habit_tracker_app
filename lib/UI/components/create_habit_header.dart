import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/common/widgets/back_button.dart';

class CreateHabitHeader extends StatelessWidget {
  final bool isEditing;
  const CreateHabitHeader({
    super.key,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          color: isEditing ? const Color(0xffFF8F8F) : theme.primaryContainer,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomBackButton(),
              ],
            ),
            Text(
              isEditing ? 'Edit Habit' : 'Create New Habit',
              style: GoogleFonts.lancelot(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
