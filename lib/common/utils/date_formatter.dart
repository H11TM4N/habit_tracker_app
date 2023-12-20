import 'package:intl/intl.dart';

DateTime dateFormatter(DateTime date) {
  String formattedDate = DateFormat.yMd().format(date);
  return DateFormat.yMd().parse(formattedDate);
}
