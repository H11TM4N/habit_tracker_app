import 'package:flutter/material.dart';
import 'package:habit_tracker_app/functions/dialogs_and_navigation.dart';
import 'package:habit_tracker_app/widgets/habit_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HabitProvider extends ChangeNotifier {


  final List<String> items = [];
  List<bool> isTaskDone = [];

  void onTap(int index) {
    isTaskDone[index] = !isTaskDone[index];
    notifyListeners();
  }

  Widget customListTile(int index) {
    return HabitTile(
      key: Key('Habit tile $index'),
      title: items[index],
      isDone: isTaskDone[index],
      onTap: () {
      onTap(index);
    },
    );
  }

  List<Widget> customList() {
    return List.generate(
      items.length,
      (index) => customListTile(index),
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

  void onPressed(BuildContext context) {
    // items.add(value);
    showDialog(
      context: context,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          yesOrNoAlertDialog(context),
          measureableAlertDialog(context),
        ],
      ),
    );
    notifyListeners();
  }

  void saveButtonOnpressed(BuildContext context, value) {
    Navigator.of(context).pop();
    items.add(value);
    isTaskDone.add(false);
    saveHabits();
    notifyListeners();
  }

  Future<void> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final savedHabits = prefs.getStringList('habits');
    if (savedHabits != null) {
      items.addAll(savedHabits);
      isTaskDone.addAll(List.generate(savedHabits.length, (index) => false));
      notifyListeners();
    }
  }

  Future<void> saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('habits', items);
  }
}
