import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/logic/cubits/habit_cubit.dart';
import 'package:habit_tracker_app/logic/cubits/habit_state.dart';
import 'package:habit_tracker_app/presentation/utils/container.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitOverview extends ConsumerWidget {
  final String habitName;
  final int index;

  const HabitOverview({
    super.key,
    required this.habitName,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HabitCubit habitCubit = BlocProvider.of<HabitCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(habitName),
        actions: [
          BlocBuilder<HabitCubit, List<HabitState>>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                 
                },
                icon: const Icon(Icons.edit),
              );
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry<dynamic>>[
                PopupMenuItem(
                  onTap: () {
                    Navigator.pop(context);
                    habitCubit.removeHabit(index);
                  },
                  child: const Text('delete'),
                )
              ];
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
                child: Kcontainer(
                  widget: Row(
                    children: [
                      const Text(
                        'Overview',
                        style: TextStyle(fontSize: 21),
                      ),
                      const SizedBox(width: 20),
                      CircularPercentIndicator(
                        radius: 20,
                        percent: 0.4,
                      ),
                    ],
                  ),
                ),
              ),
              Kcontainer(
                widget: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(DateTime.february),
                    lastDay: DateTime.now()),
              )
            ],
          ),
        ],
      ),
    );
  }
}
