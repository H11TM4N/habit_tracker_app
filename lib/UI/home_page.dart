import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/UI/pages/habit_page.dart';
import 'package:habit_tracker_app/UI/pages/stat_page.dart';
import 'package:habit_tracker_app/UI/pages/profile_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    const List<Widget> pages = <Widget>[
      HabitsPage(),
      StatPage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: pages,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          currentIndex: currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            currentIndex.value = value;
          },
          unselectedLabelStyle:
              GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          selectedLabelStyle:
              GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded), label: 'HABITS'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_rounded), label: 'STATS'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2), label: 'PROFILE'),
          ],
        ),
      ),
    );
  }
}
