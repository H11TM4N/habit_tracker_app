import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:habit_tracker_app/logic/cubits/habit_cubit.dart';
import 'package:habit_tracker_app/logic/cubits/habit_state.dart';

void main() {
  group('Habit Cubit', () {
    late HabitCubit habitCubit;

    setUp(() => habitCubit = HabitCubit());

    tearDown(() => habitCubit.close());

    test('if the initial state of the habitCubit is: []',
        () => expect(habitCubit.state, []));

    blocTest(
      '''if the add habit function displays: [HabitState( id: 1, title: 'newHabitName', question: 'newQuestion', isDone: false,
        )] ''',
      build: () => habitCubit,
      act: (cubit) => cubit.addHabit('newHabitName', 'newQuestion'),
      expect: () => [
        [
          HabitState(
            id: 1,
            title: 'newHabitName',
            question: 'newQuestion',
            isDone: false,
          )
        ]
      ],
    );
  });
}
