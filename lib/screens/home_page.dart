import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/widgets/dialogs_and_navigation/dialogs_and_navigation.dart';
import 'package:habit_tracker_app/widgets/habit_item.dart';
import 'package:habit_tracker_app/widgets/home_page_items/date_displaying_listtile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HabitProvider habitProvider = Provider.of<HabitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Habits'),
        leading: const Icon(Icons.sort),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    YesOrNoAlertDialog(),
                    MeasureableAlertDialog(),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const DateTile(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: habitProvider.habits.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key('key_${habitProvider.habits[index]}'),
                onDismissed: (direction) => habitProvider.removeHabit(index),
                background: Container(color: Colors.red),
                child: HabitTile(
                  title: habitProvider.habits[index],
                  isDone: habitProvider.isDoneList[index],
                  onTap: () {
                    habitProvider.finishedTask(index);
                  },
                  textColor: Colors.amber, // dummy
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
