import 'package:flutter/material.dart';
import 'package:habit_tracker_app/functions/dialogs_and_navigation.dart';

import '../widgets/progress_painter.dart';

class HabitProvider extends ChangeNotifier {
  final List<String> items = [];
  final double progress = 3;
  bool toggle = false;
  bool toggle2 = false;

  Widget mark() {
    return GestureDetector(
      onTap: () {
        toggle = !toggle;
        notifyListeners();
      },
      child: toggle ? const Icon(Icons.check) : const Icon(Icons.close),
    );
  }

  Widget mark2() {
    return GestureDetector(
      onTap: () {
        toggle2 = !toggle2;
        notifyListeners();
      },
      child: toggle2 ? const Icon(Icons.check) : const Icon(Icons.close),
    );
  }

  Widget customListTile(int index) {
    return ListTile(
      contentPadding: const EdgeInsets.all(9),
      tileColor: Colors.black26,
      key: Key('$index'),
      title: Text(items[index]),
      leading: CustomPaint(
        size: const Size(20, 20), // Size of the progress circle
        painter: ProgressPainter(progress: progress),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          mark(),
          const SizedBox(
            width: 20,
          ),
          mark2(),
          const SizedBox(
            width: 20,
          ),
          mark(),
          const SizedBox(
            width: 20,
          ),
          mark(),
        ],
      ),
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
    notifyListeners();
  }
}
