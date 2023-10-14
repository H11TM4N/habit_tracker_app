import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/data/models/habit_model.dart';
import 'package:habit_tracker_app/logic/bloc/habit_bloc.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_stateless_widgets/custom_card/custom_card_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitOverviewPage extends StatefulWidget {
  final int index;
  const HabitOverviewPage({
    super.key,
    required this.index,
  });

  @override
  State<HabitOverviewPage> createState() => _HabitOverviewPageState();
}

class _HabitOverviewPageState extends State<HabitOverviewPage> {
  removeHabit(Habit habit) {
    context.read<HabitBloc>().add(
          RemoveHabitEvent(habit: habit),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.habits[widget.index].title),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete habit?'),
                          actionsAlignment: MainAxisAlignment.start,
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  'This habit will be deleted permanently. This action cannot be undone.'),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('No')),
                            TextButton(
                                onPressed: () {
                                  Future.delayed(
                                    const Duration(milliseconds: 300),
                                    () =>
                                        removeHabit(state.habits[widget.index]),
                                  );
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                },
                                child: const Text('Yes'))
                          ],
                        ),
                      );
                    },
                    child: const Text('Delete'),
                  ),
                ],
              )
            ],
          ),
          body: Column(
            children: [
              Kcard(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Progress',
                        style: TextStyle(fontSize: 20),
                      ),
                      CircularPercentIndicator(
                        progressColor: Colors.blue,
                        radius: 20,
                        percent: 0.4,
                      ),
                    ],
                  ),
                ),
              ),
              const Kcard(
                height: 100,
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
