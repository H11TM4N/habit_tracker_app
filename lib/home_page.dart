import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: ReorderableListView(
        onReorder: habitProvider.onReorder,
        children: List.generate(
          habitProvider.items.length,
          (index) => ListTile(
            key: Key('$index'),
            title: Text('Item ${habitProvider.items[index]}'),
            trailing: const Icon(Icons.drag_handle_sharp),
          ),
        ),
      ),
    );
  }
}
