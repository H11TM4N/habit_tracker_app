import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/cubits/habit_cubit.dart';
import 'presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HabitCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habit Tracker App',
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
