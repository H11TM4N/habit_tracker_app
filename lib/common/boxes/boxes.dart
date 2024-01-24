import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/models/local_user.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<Habit> habitBox;
late Box<LocalUser> userBox;
late Box<Habit> selectedEventBox;
