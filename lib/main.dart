import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/habit_bloc/habit_bloc.dart';
import 'package:habit_tracker_app/logic/habit_bloc/habit_event.dart';
import 'package:habit_tracker_app/logic/theme_bloc/theme_bloc.dart';
import 'package:habit_tracker_app/logic/theme_bloc/theme_state.dart';
import 'ui/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HabitBloc()..add(HabitStartedEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Habit Tracker App',
            theme: ThemeData.dark().copyWith(
              useMaterial3: true,
              snackBarTheme: const SnackBarThemeData(
                backgroundColor: Color(0xFF79747E),
                contentTextStyle: TextStyle(color: Colors.white),
              ),
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
