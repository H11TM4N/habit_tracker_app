import 'package:flutter/material.dart';

class HabitProvider extends ChangeNotifier {
  final List<String> items = List.generate(2, (index) => index.toString());

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
  }

  void onPressed(value) {
    items.add(value);
  }
}
