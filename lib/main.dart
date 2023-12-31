import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_app/UI/home_page.dart';
import 'package:habit_tracker_app/UI/theme/theme.dart';
import 'package:habit_tracker_app/models/enums/gender.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/models/local_user.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/boxes/boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalUserAdapter());
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(GenderAdapter());
  habitBox = await Hive.openBox<Habit>('habitBox');
  userBox = await Hive.openBox<LocalUser>('userBox');

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
