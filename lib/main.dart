import 'package:flutter/material.dart';
import 'package:habit_tracker_app/UI/home_page.dart';
import 'package:habit_tracker_app/UI/theme/theme.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker App',
      theme: theme,
      home: const HomePage(),
    );
  }
}
