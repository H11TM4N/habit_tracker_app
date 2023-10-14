import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/bloc/habit_bloc.dart';
import 'package:habit_tracker_app/presentation/widgets/custom_stateless_widgets/custom_card/custom_card_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitOverviewPage extends StatelessWidget {
  final int index;
  const HabitOverviewPage({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.habits[index].title),
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
                  children: [
                    
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
