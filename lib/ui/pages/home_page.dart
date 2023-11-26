import 'package:flutter/material.dart';
import 'package:habit_tracker_app/common/utils.dart';
import 'package:habit_tracker_app/logic/providers/habit_provider.dart';
import 'package:habit_tracker_app/logic/providers/theme_provider.dart';
import 'package:habit_tracker_app/ui/pages/create_habit_page.dart';
import 'package:provider/provider.dart';
import 'habit_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final isDarkMode = context.watch<ThemeProvider>().isDarkmode;
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        backgroundColor: theme.primary,
        title: const Text('Habits'),
        actions: [
          IconButton(
            onPressed: onAddHabitTap,
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Settings'),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Dark mode'),
                      Checkbox(
                        value: isDarkMode,
                        onChanged: (value) {
                          context.read<ThemeProvider>().toggleTheme();
                        },
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: HabitBody(
              status: status,
              habits: habits,
            ),
          )
        ],
      ),
    );
  }
}
