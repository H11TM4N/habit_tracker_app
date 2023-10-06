import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:habit_tracker_app/utils/container.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(habitName),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry<dynamic>>[
                PopupMenuItem(
                  onTap: () {
                    Navigator.pop(context);
                    ref.watch(habitProvider.notifier).removeHabit(index);
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
            ],
          ),
        ],
      ),
    );
  }
}
