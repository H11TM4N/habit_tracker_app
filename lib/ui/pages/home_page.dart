import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/common/utils.dart';
import 'package:habit_tracker_app/data/models/habit_model.dart';
import 'package:habit_tracker_app/logic/bloc/habit_bloc.dart';
import 'package:habit_tracker_app/logic/bloc/habit_event.dart';
import 'package:habit_tracker_app/logic/bloc/habit_state.dart';
import 'package:habit_tracker_app/ui/pages/habit_overview_page.dart';
import 'package:habit_tracker_app/ui/widgets/custom_stateless_widgets/custom_page_transition/custom_page_route_transition.dart';
import 'package:habit_tracker_app/ui/widgets/custom_stateless_widgets/custom_slidable_widget/slidable_widget.dart';
import 'package:habit_tracker_app/ui/widgets/custom_stateless_widgets/custom_textfields/textfield.dart';
import 'package:habit_tracker_app/ui/widgets/habit_item/habit_item.dart';
import 'package:habit_tracker_app/ui/widgets/utils/material_button.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  bool _showUnfinishedTasks = false;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _questionController.dispose();
  }

  addHabit(Habit habit) {
    context.read<HabitBloc>().add(
          AddHabitEvent(habit: habit),
        );
  }

  removeHabit(Habit habit) {
    context.read<HabitBloc>().add(
          RemoveHabitEvent(habit: habit),
        );
  }

  toggleHabits(int index) {
    context.read<HabitBloc>().add(
          ToggleHabitEvent(index: index),
        );
  }

  reorderHabits(int oldIndex, int newIndex, Habit movedHabit) {
    context.read<HabitBloc>().add(ReorderHabitsEvent(newIndex, movedHabit));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return _createHabitScreen(context);
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.transparent,
            leading: const Text(
              'Today\'s\n Habits',
              style: TextStyle(fontSize: 15),
            ),
            trailing: Text(
              DateFormat('EEE, MMM d').format(DateTime.now()),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: BlocConsumer<HabitBloc, HabitState>(
              buildWhen: _onBuildWhen,
              builder: _builder,
              listenWhen: _onListenWhen,
              listener: _listener,
            ),
          ),
        ],
      ),
      drawer: _drawer(),
    );
  }

  bool _onBuildWhen(HabitState previous, HabitState current) {
    return current.status == HabitStatus.initial ||
        current.status == HabitStatus.loading ||
        current.status == HabitStatus.success ||
        current.status == HabitStatus.error;
  }

  bool _onListenWhen(HabitState previous, HabitState current) {
    return current.status == HabitStatus.added ||
        current.status == HabitStatus.removed;
  }

  Widget _builder(context, state) {
    if (state.status == HabitStatus.success) {
      return ReorderableListView.builder(
        key: Key('Key ${state.habits.length} '),
        onReorder: (oldIndex, newIndex) {
          final movedHabit = state.habits[oldIndex];
          reorderHabits(oldIndex, newIndex, movedHabit);
        },
        itemCount: state.habits.length,
        itemBuilder: (context, index) {
          if (_showUnfinishedTasks && state.habits[index].isDone) {
            return const SizedBox.shrink();
          } else {
            return _habitItem(index, state, context);
          }
        },
      );
    } else if (state.status == HabitStatus.initial) {
      return const Center(child: Text('No habits added yet...'));
    } else {
      return const Text('Error');
    }
  }

  void _listener(BuildContext context, HabitState state) {
    if (state.status == HabitStatus.added) {
      showSnackBar(context, 'Habit added');
    } else if (state.status == HabitStatus.removed) {
      showSnackBar(context, 'Habit removed');
    }
  }

  Padding _createHabitScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          KtextField(
            title: 'Habit title',
            controller: _titleController,
            hintText: 'e.g. Excercise',
          ),
          KtextField(
            title: 'Question',
            controller: _questionController,
            hintText: 'e.g. Did you excercise today?',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kMaterialButton(() => Navigator.pop(context), 'Cancel'),
              kMaterialButton(() {
                addHabit(Habit(
                  title: _titleController.text,
                  subtitle: _questionController.text,
                ));
                _titleController.clear();
                _questionController.clear();
                Navigator.pop(context);
              }, 'Add Habit'),
            ],
          ),
        ],
      ),
    );
  }

  KslidableWidget _habitItem(
      int index, HabitState state, BuildContext context) {
    return KslidableWidget(
      key: Key('key $index'),
      onCheck: (_) => toggleHabits(index),
      onDelete: (_) => removeHabit(state.habits[index]),
      isDone: state.habits[index].isDone,
      child: HabitTile(
        title: state.habits[index].title,
        subtitle: state.habits[index].subtitle,
        tileOnTap: () => Navigator.push(
          context,
          MyCustomRouteTransition(
              route: HabitOverviewPage(
            index: index,
          )),
        ),
        isDone: state.habits[index].isDone,
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
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
        ],
      ),
    );
  }
}
