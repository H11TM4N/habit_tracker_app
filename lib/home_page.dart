import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:provider/provider.dart';

import 'providers/current_date_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateProvider dateProvider = Provider.of<DateProvider>(context);
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Habits'),
        leading: const Icon(Icons.sort),
        actions: [
          IconButton(
            onPressed: () {
              habitProvider.onPressed(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Today'),
                    Text(
                      dateProvider.currentDate,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ReorderableListView(
              onReorder: habitProvider.onReorder,
              children: habitProvider.customList(),
            ),
          ),
        ],
      ),
    );
  }
}
