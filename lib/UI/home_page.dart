import 'package:flutter/material.dart';
import 'package:habit_tracker_app/UI/pages/habit_page.dart';
import 'package:habit_tracker_app/UI/pages/history_page.dart';
import 'package:habit_tracker_app/UI/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const <Widget>[
    HabitsPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), label: 'HABITS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded), label: 'HISTORY'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'PROFILE'),
        ],
      ),
    );
  }
}
