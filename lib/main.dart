import 'package:flutter/material.dart';
import 'package:habit_tracker_app/providers/current_date_provider.dart';
import 'package:habit_tracker_app/providers/habit_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

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
        )
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
