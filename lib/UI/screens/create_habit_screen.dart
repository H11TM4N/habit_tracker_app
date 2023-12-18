import 'package:flutter/material.dart';
import 'package:habit_tracker_app/common/widgets/back_button.dart';

class CreateHabitScreen extends StatelessWidget {
  const CreateHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomBackButton(),
            
          ],
        ),
      ),
    );
  }
}
