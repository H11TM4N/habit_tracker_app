import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitOverviewProvider extends ChangeNotifier {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  CalendarFormat get calendarFormat => _calendarFormat;
  DateTime get focusedDay => _focusedDay;
  DateTime? get selectedDay => _selectedDay;

  set calendarFormat(CalendarFormat format) {
    _calendarFormat = format;
    notifyListeners();
  }

  set focusedDay(DateTime day) {
    _focusedDay = day;
    notifyListeners();
  }

  set selectedDay(DateTime? day) {
    _selectedDay = day;
    notifyListeners();
  }
}
