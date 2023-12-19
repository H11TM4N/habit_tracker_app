import 'package:flutter/material.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/UI/pages/views/fab_view.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HabitsHeader(),
          HabitsLinearProgress(),
        ],
      ),
      floatingActionButton: FabView(),
    );
  }
}
