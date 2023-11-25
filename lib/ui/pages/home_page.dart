import 'package:flutter/material.dart';
import 'package:habit_tracker_app/common/utils.dart';
import 'package:habit_tracker_app/logic/providers/habit_provider.dart';
import 'package:habit_tracker_app/logic/providers/theme_provider.dart';
import 'package:habit_tracker_app/ui/pages/create_habit_page.dart';
import 'package:habit_tracker_app/ui/pages/habit_overview_page.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../widgets/widgets.dart';

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
      backgroundColor: theme.background,
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.transparent,
            leading: const Text(
              'Today\'s\n Habits',
              style: TextStyle(fontSize: 15),
            ),
            trailing: Text(
              dateFormat().format(DateTime.now()),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: status == HabitStatus.success
                ? ReorderableListView.builder(
                    key: Key('Key ${habits.length} '),
                    onReorder: (oldIndex, newIndex) {
                      final movedHabit = habits[oldIndex];
                      context
                          .read<HabitProvider>()
                          .reorderHabits(oldIndex, newIndex, movedHabit);
                    },
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      if (_showUnfinishedTasks && habits[index].isDone) {
                        return const SizedBox.shrink();
                      } else {
                        return KslidableWidget(
                          key: Key('key $index'),
                          onCheck: (_) =>
                              context.read<HabitProvider>().toggleHabit(index),
                          onDelete: (_) {
                            context
                              .read<HabitProvider>()
                              .removeHabit(habits[index]);
                              showSnackBar(context, 'Habit removed');
                          },
                          isDone: habits[index].isDone,
                          child: HabitTile(
                            title: habits[index].title,
                            subtitle: habits[index].subtitle,
                            tileOnTap: () => Navigator.push(
                              context,
                              MyCustomRouteTransition(
                                  route: HabitOverviewPage(
                                index: index,
                              )),
                            ),
                            isDone: habits[index].isDone,
                          ),
                        );
                      }
                    },
                  )
                : status == HabitStatus.initial
                    ? const Center(child: Text('No habits added yet...'))
                    : const Text('Error'),
          )
        ],
      ),
      drawer: Drawer(
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
      ),
    );
  }
}
