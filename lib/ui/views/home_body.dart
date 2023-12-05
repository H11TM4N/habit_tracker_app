import 'package:flutter/material.dart';
import 'package:habit_tracker_app/common/utils.dart';
import 'package:habit_tracker_app/logic/providers/habit_provider.dart';
import 'package:habit_tracker_app/ui/pages/create_habit_page.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../pages/habit_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
    return SafeArea(
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
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                color: theme.primary,
                child: Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      rowHeight: 40.0,
                      calendarFormat: CalendarFormat.week,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      headerStyle: const HeaderStyle(
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
        ],
      ),
    );
  }
}
