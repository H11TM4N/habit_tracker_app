import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<int> items = List<int>.generate(30, (int index) => index);

    void onReorder(int oldIndex, int newIndex) {
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = items.removeAt(oldIndex);
        items.insert(newIndex, item);
      });
    }

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
        onReorder: onReorder,
        children: List.generate(
          items.length,
          (index) => ListTile(
            key: Key('$index'),
            title: Text('Item ${items[index]}'),
            trailing: const Icon(Icons.drag_handle_sharp),
          ),
        ),
      ),
    );
  }
}
