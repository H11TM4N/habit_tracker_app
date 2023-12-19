import 'package:flutter/material.dart';
import 'package:habit_tracker_app/UI/pages/habit_page.dart';
import 'package:habit_tracker_app/UI/pages/history_page.dart';
import 'package:habit_tracker_app/UI/pages/profile_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    const List<Widget> pages = <Widget>[
      HabitsPage(),
      HistoryPage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        currentIndex: currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          currentIndex.value = value;
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
