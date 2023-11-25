import 'package:flutter/material.dart';
import 'package:habit_tracker_app/common/theme.dart';
import 'package:habit_tracker_app/logic/providers/habit_provider.dart';
import 'package:provider/provider.dart';
import 'logic/providers/theme_provider.dart';
import 'ui/pages/home_page.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HabitProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
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
      theme: context.watch<ThemeProvider>().isDarkmode
          ? KthemeData.darkTheme
          : KthemeData.lightTheme,
      home: const HomePage(),
    );
  }
}
