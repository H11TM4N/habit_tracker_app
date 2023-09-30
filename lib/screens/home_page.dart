import 'package:flutter/material.dart';
import 'package:habit_tracker_app/screens/add_habit_screens/yes_or_no_screen.dart';
import 'package:habit_tracker_app/widgets/custom_page_transition/custom_page_route_transition.dart';
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
              Navigator.of(context).push(
                MyCustomRouteTransition(route: const AddHAbitScreen()),
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
