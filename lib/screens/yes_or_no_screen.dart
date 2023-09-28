import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../providers/habit_provider.dart';

class YesOrNoScreen extends StatefulWidget {
  const YesOrNoScreen({super.key});

  @override
  State<YesOrNoScreen> createState() => _YesOrNoScreenState();
}

class _YesOrNoScreenState extends State<YesOrNoScreen> {
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
                Navigator.pop(context, color);
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
      setState(() {
        habitTextColor = selectedColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    final nameController = TextEditingController();
    final questionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create habit'),
        actions: [
          ElevatedButton(
              onPressed: () {
                habitProvider.saveButtonOnpressed(
                  context,
                  nameController.text,
                );
              },
              child: const Text('SAVE'))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  title: 'Name',
                  hintText: 'Exercise',
                  controller: nameController,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showColorSelectionDialog(context);
                },
                child: SizedBox(
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: habitTextColor ?? Colors.black12,
                      title: const Center(
                        child: Text(
                          'Color',
                          style: TextStyle(
                            color: Colors.white, // Set a default text color
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomTextField(
            title: 'Question',
            hintText: 'Did you exercise today?',
            controller: questionController,
          ),
        ],
      ),
    );
  }
}
