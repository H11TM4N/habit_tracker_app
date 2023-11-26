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
  bool _showUnfinishedTasks = false;

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
            onPressed: () {
              slideUpPageTransition(
                context: context,
                page: const CreateHabitPage(),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: HabitBody(
              status: status,
              habits: habits,
              showUnfinishedTasks: _showUnfinishedTasks,
            ),
          )
        ],
      ),
      drawer: _drawer(theme, isDarkMode, context),
    );
  }

  Widget _drawer(ColorScheme theme, bool isDarkMode, BuildContext context) {
    return Drawer(
      backgroundColor: theme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(child: Text('filter habits')),
          ),
          SwitchListTile(
            title: const Text('Show unfinished tasks'),
            value: _showUnfinishedTasks,
            onChanged: (value) {
              setState(() {
                _showUnfinishedTasks = !_showUnfinishedTasks;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Dark mode'),
            value: isDarkMode,
            onChanged: (value) {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
