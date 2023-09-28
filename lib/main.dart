import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/create_habit_provider.dart';
import 'package:habit_tracker_app/providers/current_date_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'providers/habit_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HabitProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateHabitProvider(),
        ),
      ],
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
