import 'package:flutter/material.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_stateless_widgets/custom_textfields/textfield.dart';
import 'package:habit_tracker_app/presentation/widgets/utils/material_button.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        KtextField(
                          title: 'Habit title',
                          controller: titleController,
                          hintText: 'e.g. Excercise',
                        ),
                        KtextField(
                          title: 'Question',
                          controller: questionController,
                          hintText: 'e.g. Did you excercise today?',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kMaterialButton(
                                () => Navigator.pop(context), 'Cancel'),
                            kMaterialButton(() {
                              Navigator.pop(context);
                            }, 'Add Habit'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.transparent,
            leading: const Text(
              'Today\'s\n Habits',
              style: TextStyle(fontSize: 15),
            ),
            trailing: Text(
              DateFormat('EEE, MMM d').format(DateTime.now()),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Center(child: Text('filter habits')),
            ),
            SwitchListTile(
              title: const Text('Show unfinished tasks'),
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
