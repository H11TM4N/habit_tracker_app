import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/bloc/habit_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker App',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.black45,
          contentTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: BlocProvider(
        create: (context) => HabitBloc()..add(HabitStartedEvent()),
        child: const HomePage(),
      ),
    );
  }
}
