import 'package:flutter/material.dart';
import 'package:habit_tracker_app/widgets/dialogs_and_navigation/dialogs_and_navigation.dart';
import 'package:habit_tracker_app/widgets/habits.dart';
import 'package:habit_tracker_app/widgets/home_page_items/date_displaying_listtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        children: [
          DateTile(),
          Expanded(child: Habits()),
        ],
      ),
    );
  }
}
