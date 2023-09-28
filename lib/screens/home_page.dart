import 'package:flutter/material.dart';
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
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Column(
        children: [
          DateTile(),
        ],
      ),
    );
  }
}
