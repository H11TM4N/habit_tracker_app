import 'package:flutter/material.dart';

class CreateHabitProvider extends ChangeNotifier {
  Color? habitTextColor; // Store the selected text color for the habit

  // Define a list of colors to choose from
  final List<Color> colorOptions = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  // Function to show a dialog with color options
  Future<void> showColorSelectionDialog(BuildContext context) async {
    final selectedColor = await showDialog<Color>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select Text Color'),
          children: colorOptions.map((color) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                color: color,
                height: 40,
              ),
            );
          }).toList(),
        );
      },
    );

    if (selectedColor != null) {
      habitTextColor = selectedColor;
      notifyListeners();
    }
  }
}
