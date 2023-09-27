import 'package:flutter/material.dart';

class HabitProvider extends ChangeNotifier {
  final List<String> items = ['1', '2', '3'];

  List<Widget> customList() {
    return List.generate(
      items.length,
      (index) => ListTile(
        key: Key('$index'),
        title: Text('Item ${items[index]}'),
        trailing: const Icon(Icons.drag_handle_sharp),
      ),
    );
  }

  Widget alertDialog() {
    return AlertDialog(
      
    );
  }

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    notifyListeners();
  }

  void onPressed(String value) {
    items.add(value);
    notifyListeners();
  }
}
