import 'package:intl/intl.dart';

DateTime dateFormatter(DateTime date) {
  return DateFormat('MMM dd').format(date) as DateTime;
}
