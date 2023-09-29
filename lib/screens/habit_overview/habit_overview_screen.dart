import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/create_habit_provider.dart';

class HabitOverviewScreen extends StatelessWidget {
  const HabitOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateHabitProvider createHabitProvider =
        Provider.of<CreateHabitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(createHabitProvider.nameController.text),
      ),
    );
  }
}
