import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitOverviewProvider extends ChangeNotifier {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
}
