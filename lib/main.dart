import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/UI/home_page.dart';
import 'package:habit_tracker_app/UI/theme/theme.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/boxes/boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HabitAdapter());
  box = await Hive.openBox<Habit>('habitBox');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
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
