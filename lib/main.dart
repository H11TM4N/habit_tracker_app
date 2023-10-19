import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/logic/bloc/habit_bloc.dart';
import 'package:habit_tracker_app/logic/bloc/habit_event.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HabitBloc()..add(HabitStartedEvent()),
      child: MaterialApp(
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
      ),
    );
  }
}
