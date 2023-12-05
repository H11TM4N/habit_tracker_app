import 'package:flutter/material.dart';
import 'package:habit_tracker_app/ui/views/bottom_bar_view.dart';
import 'package:habit_tracker_app/ui/views/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: IndexedStack(
        children: [
          HomeView(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
        ],
      ),
      bottomNavigationBar: const BottomBarView(),
    );
  }
}
