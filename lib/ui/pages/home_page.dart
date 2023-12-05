import 'package:flutter/material.dart';
import 'package:habit_tracker_app/common/utils.dart';
import 'package:habit_tracker_app/logic/providers/habit_provider.dart';
import 'package:habit_tracker_app/ui/pages/create_habit_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'habit_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  void onAddHabitTap() {
    slideUpPageTransition(
      context: context,
      page: const CreateHabitPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final habits = context.watch<HabitProvider>().habits;
    final status = context.watch<HabitProvider>().status;
    // final isDarkMode = context.watch<ThemeProvider>().isDarkmode;
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.inversePrimary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Habits'),
                  const Spacer(),
                  IconButton.filled(
                    onPressed: onAddHabitTap,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Container(
                  color: theme.background,
                  child: Column(
                    children: [
                      TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        rowHeight: 40.0, // Set the height of each calendar cell
                        availableCalendarFormats: {
                          CalendarFormat.month: 'Month'
                        },
                        startingDayOfWeek: StartingDayOfWeek.monday,

                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                        ),
                      ),
                      Expanded(
                        child: HabitBody(
                          status: status,
                          habits: habits,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: BottomAppBar(
                shape: CircularNotchedRectangle(),
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
