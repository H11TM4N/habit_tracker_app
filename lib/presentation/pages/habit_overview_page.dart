import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/data/models/habit_completion.dart';
import 'package:habit_tracker_app/data/models/habit_model.dart';
import 'package:habit_tracker_app/logic/bloc/habit_bloc.dart';
import 'package:habit_tracker_app/logic/bloc/habit_event.dart';
import 'package:habit_tracker_app/logic/bloc/habit_state.dart';
import 'package:habit_tracker_app/logic/habit_completion_bloc/habit_completion_bloc.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_stateless_widgets/custom_card/custom_card_widget.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_stateless_widgets/custom_textfields/textfield.dart';
import 'package:habit_tracker_app/presentation/widgets/habit_calendar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../widgets/utils/material_button.dart';

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
    context.read<HabitBloc>().add(RemoveHabitEvent(habit: habit));
  }

  editHabit(int index, Habit updatedHabit) {
    context.read<HabitBloc>().add(EditHabitEvent(index, updatedHabit));
  }

  Map<DateTime, List<HabitCompletion>> get completions {
    final completionsState = context.read<HabitCompletionBloc>().state;
    return completionsState.completions;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(
      builder: (ctx, state) {
        final TextEditingController titleController =
            TextEditingController(text: state.habits[widget.index].title);
        final TextEditingController questionController =
            TextEditingController(text: state.habits[widget.index].subtitle);
        return Scaffold(
          appBar: AppBar(
            title: Text(state.habits[widget.index].title),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Column(
                          children: [
                            KtextField(
                              title: 'Habit title',
                              controller: titleController,
                              hintText: 'e.g. Excercise',
                            ),
                            KtextField(
                              title: 'Question',
                              controller: questionController,
                              hintText: 'e.g. Did you excercise today?',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                kMaterialButton(
                                    () => Navigator.pop(context), 'Cancel'),
                                kMaterialButton(() {
                                  editHabit(
                                      widget.index,
                                      Habit(
                                          title: titleController.text,
                                          subtitle: questionController.text));
                                  titleController.clear();
                                  questionController.clear();
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                }, 'Save change'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
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
          body: ListView(
            children: [
              Kcard(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Progress',
                        style: TextStyle(fontSize: 17),
                      ),
                      CircularPercentIndicator(
                        progressColor: Colors.blue,
                        radius: 25,
                        percent: 0.4,
                      ),
                    ],
                  ),
                ),
              ),
              Kcard(
                height: 400,
                child: Column(
                  children: [
                    Expanded(
                      child: HabitCalendar(habitCompletions: completions),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
