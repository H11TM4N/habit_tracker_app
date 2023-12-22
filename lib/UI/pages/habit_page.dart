import 'package:flutter/material.dart';
import 'package:habit_tracker_app/UI/components/components.dart';
import 'package:habit_tracker_app/UI/pages/views/drawer.dart';
import 'package:habit_tracker_app/UI/pages/views/fab_view.dart';
import 'package:habit_tracker_app/UI/pages/views/habit_list_view.dart';
import 'package:habit_tracker_app/main.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        children: [
          HabitsHeader(
            onOpenDrawer: () => scaffoldKey.currentState?.openDrawer(),
          ),
          const HabitsLinearProgress(),
          const HabitListView(),
        ],
      ),
      floatingActionButton: const FabView(),
      drawer: MyDrawer(),
    );
  }
}
